#include "ros/ros.h"
#include "tf2_ros/transform_listener.h"
#include "tf2_ros/buffer.h"
#include "geometry_msgs/PointStamped.h"
#include "geometry_msgs/TransformStamped.h"
#include "tf2_geometry_msgs/tf2_geometry_msgs.h"

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"multitransformsubNode");
    ROS_INFO("multitransformsub info:\n");
    ros::NodeHandle nh;
    tf2_ros::Buffer buffer;
    tf2_ros::TransformListener sub(buffer);

    geometry_msgs::PointStamped ps_systemOne;
    ps_systemOne.header.stamp = ros::Time::now();
    ps_systemOne.header.frame_id = "systemOne";
    ps_systemOne.point.x = 0.0;
    ps_systemOne.point.y = 0.0;
    ps_systemOne.point.z = 0.0;

    ros::Rate rate(10);
    // ros::Duration(3).sleep();
    while(ros::ok()) {
        try {
            geometry_msgs::PointStamped ps_systemTwo;
            ps_systemTwo = buffer.transform(ps_systemOne,"systemTwo");
            ROS_INFO("-------------------------------------------------------");
            ROS_INFO("<C++>%s position is x:%.2f y:%.2f z:%.2f",
                        ps_systemTwo.header.frame_id.c_str(),
                        ps_systemTwo.point.x,
                        ps_systemTwo.point.y,
                        ps_systemTwo.point.z);

            geometry_msgs::TransformStamped tfs_One2Two;
            tfs_One2Two = buffer.lookupTransform("systemTwo","systemOne",ros::Time(0.0));
            ROS_INFO("<C++>%s refer to %s:translation(%.2f,%.2f,%.2f),rotation(%.2f,%.2f,%.2f,%.2f)",
                                tfs_One2Two.child_frame_id.c_str(),
                                tfs_One2Two.header.frame_id.c_str(),
                                tfs_One2Two.transform.translation.x,
                                tfs_One2Two.transform.translation.y,
                                tfs_One2Two.transform.translation.z,
                                tfs_One2Two.transform.rotation.x,
                                tfs_One2Two.transform.rotation.y,
                                tfs_One2Two.transform.rotation.z,
                                tfs_One2Two.transform.rotation.w
                                );
        }
        catch(const std::exception& e) {
            ROS_WARN("error subscribe! about:%s",e.what());
        }   
        rate.sleep();
        ros::spinOnce();   
    }

    return 0;
}
