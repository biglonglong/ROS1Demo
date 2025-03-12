#include "ros/ros.h"
#include "tf2_ros/static_transform_broadcaster.h"
#include "geometry_msgs/TransformStamped.h"
#include "tf2/LinearMath/Quaternion.h"

// rosrun tf2_ros static_transform_publisher tfs.transform.translation & euler /base_link /<sensor>
int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"statictrasformpubNode");
    ROS_INFO("statictrasformpub info:\n");
    ros::NodeHandle nh;
    tf2_ros::StaticTransformBroadcaster pub; // topic:/tf_static

    geometry_msgs::TransformStamped tfs;
    tfs.header.stamp = ros::Time::now();
    tfs.header.frame_id = "base_link";
    tfs.child_frame_id = "laser";
    tfs.transform.translation.x = 0.2;
    tfs.transform.translation.y = 0.0;
    tfs.transform.translation.z = 0.5;
    tf2::Quaternion qtn;
    qtn.setRPY(0.0,0.0,0.0);
    tfs.transform.rotation.x = qtn.getX();
    tfs.transform.rotation.y = qtn.getY();
    tfs.transform.rotation.z = qtn.getZ();
    tfs.transform.rotation.w = qtn.getW();

    pub.sendTransform(tfs);
    ROS_INFO("%s refer to %s",tfs.child_frame_id.c_str(),tfs.header.frame_id.c_str());
    ros::spin();

    return 0;
}
