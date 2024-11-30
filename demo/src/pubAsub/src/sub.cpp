#include "ros/ros.h"
#include "pubAsub/info.h"
// #include  "std_msgs/String.h"

void doMsg(const pubAsub::info::ConstPtr& msg) {
    ROS_INFO("received from pub:count-%d,name-%s,infomation-%.2f",msg->count,msg->name.c_str(),msg->information);
}

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"subNode");
    ROS_INFO("subscriber info:\n");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("msgContent",10,doMsg);
    
    ros::spin();

    return 0;
}
