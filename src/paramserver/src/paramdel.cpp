#include "ros/ros.h"

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"paramdelNode");
    ros::NodeHandle nh;

    bool flag = nh.deleteParam("radius");
    // bool flag = ros::param::del("radius");
    if (flag) {
        ROS_INFO("del success!");
    } else {
        ROS_ERROR("del failed!");
    }

    return 0;
}
