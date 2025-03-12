#include "ros/ros.h"
#include "serverAclient/addints.h"

bool doNums(serverAclient::addints::Request& request,
            serverAclient::addints::Response& response) {
    int num1 = request.num1;
    int num2 = request.num2;
    int sum = num1+num2;
    response.res = sum;
    ROS_INFO("%d+%d=%d",num1,num2,sum);
    return true;
}

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"serverNode");
    ROS_INFO("server generated:\n");
    ros::NodeHandle nh;
    ros::ServiceServer server = nh.advertiseService("Addints",doNums);
    
    ros::spin();

    return 0;
}
