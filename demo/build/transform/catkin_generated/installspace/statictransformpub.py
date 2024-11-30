#!/usr/bin/env python3
import rospy
import tf_conversions
import tf2_ros
from geometry_msgs.msg import TransformStamped 

# rosrun tf2_ros static_transform_publiher tfs.transform.translation & euler /base_link /<sensor>
if __name__ == "__main__":
    rospy.init_node("statictrasformpubNode")
    rospy.loginfo("statictrasformpub info:")
    pub = tf2_ros.StaticTransformBroadcaster()

    tfs = TransformStamped()
    tfs.header.stamp = rospy.Time.now()
    tfs.header.frame_id = "base_link"
    tfs.child_frame_id = "laser"
    tfs.transform.translation.x = 0.2
    tfs.transform.translation.y = 0.0
    tfs.transform.translation.z = 0.5
    qtn = tf_conversions.transformations.quaternion_from_euler(0.0,0.0,0.0)
    tfs.transform.rotation.x = qtn[0]
    tfs.transform.rotation.y = qtn[1]
    tfs.transform.rotation.z = qtn[2]
    tfs.transform.rotation.w = qtn[3]

    pub.sendTransform(tfs)
    rospy.loginfo("%s refer to %s",tfs.child_frame_id,tfs.header.frame_id)
    rospy.spin()


