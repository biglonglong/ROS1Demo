#include "ros/ros.h"
#include "pubAsub/info.h"
// #include  "std_msgs/String.h"
// #include <sstream>

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"pubNode");
    ROS_INFO("publisher info:\n");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<pubAsub::info>("msgContent",10,true);

    pubAsub::info msg;
    msg.name = "biglonglong";
    msg.information = 2.8;
    msg.count = 0;
    // std_msgs::String msg;
    // int count = 0;

    ros::Rate rate(1);
    ros::Duration(3).sleep();
    while (ros::ok()) {
        msg.count++;
        // count++;
        // std::stringstream ss;
        // ss << "std_msg" << count;
        // ss >> msg.data;
        if(msg.count>1000) {
            ros::shutdown();
        }
        pub.publish(msg);
        ROS_INFO("publishd to sub:%d",msg.count);
        rate.sleep();
        ros::spinOnce();
    }
    
    return 0;
}
