#include "ros/ros.h"
#include "serverAclient/addints.h"

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"clientNode");
    ROS_INFO("client generated:\n");
    if(argc !=3) {
        ROS_ERROR("error argc!");
        return 1;
    }
    ros::NodeHandle nh;
    ros::ServiceClient client = nh.serviceClient<serverAclient::addints>("Addints");
    
    serverAclient::addints ints;
    ints.request.num1 = atoi(argv[1]);
    ints.request.num2 = atoi(argv[2]);

    client.waitForExistence();
    // ros::service::waitForService("addints");
    bool flag = client.call(ints);
    if(flag) {
        ROS_INFO("rosponse:%d",ints.response.res);
    } else {
        ROS_ERROR("error rosponse!");
    }
    
    return 0;
}
