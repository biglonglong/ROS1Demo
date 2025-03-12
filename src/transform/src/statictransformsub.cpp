#include "ros/ros.h"
#include "tf2_ros/transform_listener.h"
#include "tf2_ros/buffer.h"
#include "geometry_msgs/PointStamped.h"
#include "tf2_geometry_msgs/tf2_geometry_msgs.h"

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"statictransformsubNode");
    ROS_INFO("statictransformsub info:\n");
    ros::NodeHandle nh;
    tf2_ros::Buffer buffer;
    tf2_ros::TransformListener sub(buffer);

    geometry_msgs::PointStamped ps_laser;
    ps_laser.header.stamp = ros::Time::now();
    ps_laser.header.frame_id = "laser";
    ps_laser.point.x = 2.0;
    ps_laser.point.y = 3.0;
    ps_laser.point.z = 5.0;

    ros::Rate rate(10);
    // ros::Duration(3).sleep();
    while(ros::ok()) {
        try {
            geometry_msgs::PointStamped ps_base;
            ps_base = buffer.transform(ps_laser,"base_link");
            ROS_INFO("<C++>%s position is x:%.2f y:%.2f z:%.2f",
                        ps_base.header.frame_id.c_str(),
                        ps_base.point.x,
                        ps_base.point.y,
                        ps_base.point.z);
        }
        catch(const std::exception& e) {
            ROS_WARN("error subscribe! about:%s",e.what());
        }   
        rate.sleep();
        ros::spinOnce();   
    }

    return 0;
}
