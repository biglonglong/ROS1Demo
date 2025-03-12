#include "ros/ros.h"

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"paramgetNode");
    ros::NodeHandle nh;

    double radius = nh.param("radius",0.15);
    // double radius = ros::param::param("radius",0.15);
    // double radius = 0.0;
    // bool result = nh.hasParam("radius");
    // // bool result = ros::param::has("radius");
    // nh.searchParam("radius",radius);
    // // ros::param::search("radius",radius);
    // bool result = nh.getParam("radius",radius);
    // // ros::param::get("radius",radius);
    // bool result = nh.getParamCached("radius",radius);
    // // bool result = ros::param::getCached("radius",radius);
    if(radius != 0.15) {
        ROS_INFO("radius:%.2f",radius);
    } else {
        ROS_WARN("nothing about radius");
    }

    std::vector<std::string> names;
    nh.getParamNames(names);
    // ros::param::getParamNames(names);
    ROS_INFO("names:");
    for(auto &&name : names) {
        ROS_INFO("%s",name.c_str());
    }
    
    return 0;
}
