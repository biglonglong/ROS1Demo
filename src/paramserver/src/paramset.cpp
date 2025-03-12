#include "ros/ros.h"

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");
    
    ros::init(argc,argv,"paramsetNode");
    ros::NodeHandle nh;

    double radius = 0.75;
    nh.setParam("radius",radius);
    // ros::param::set("radius",radius);
    ROS_INFO("radius:%.2f",radius);
    
    return 0;
}
