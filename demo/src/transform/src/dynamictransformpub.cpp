#include "ros/ros.h"
#include "turtlesim/Pose.h"
#include "tf2_ros/transform_broadcaster.h"
#include "geometry_msgs/TransformStamped.h"
#include "tf2/LinearMath/Quaternion.h"

void doPose(const turtlesim::Pose::ConstPtr& pose) {
    static tf2_ros::TransformBroadcaster pub; // topic:/tf

    geometry_msgs::TransformStamped tfs;
    tfs.header.stamp = ros::Time::now();
    tfs.header.frame_id = "world";
    tfs.child_frame_id = "turtle1";
    tfs.transform.translation.x = pose->x;
    tfs.transform.translation.y = pose->y;
    tfs.transform.translation.z = 0.0;
    tf2::Quaternion qtn;
    qtn.setRPY(0.0,0.0,pose->theta);
    tfs.transform.rotation.x = qtn.getX();
    tfs.transform.rotation.y = qtn.getY();
    tfs.transform.rotation.z = qtn.getZ();
    tfs.transform.rotation.w = qtn.getW();

    pub.sendTransform(tfs);
    ROS_INFO("%s refer to %s",tfs.child_frame_id.c_str(),tfs.header.frame_id.c_str());
}

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"dynamictransformpubNode");
    ROS_INFO("dynamictransformpub info:\n");
    ros::NodeHandle nh;
    ros::Subscriber turtle1posesub = nh.subscribe("/turtle1/pose",100,doPose);
    ros::spin();

    return 0;
}
