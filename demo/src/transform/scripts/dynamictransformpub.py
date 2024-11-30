#! /usr/bin/env python
import rospy
from turtlesim.msg import Pose
import tf_conversions
import tf2_ros
from geometry_msgs.msg import TransformStamped 

def doPose(pose):
    pub = tf2_ros.TransformBroadcaster()

    tfs = TransformStamped()
    tfs.header.stamp = rospy.Time.now()
    tfs.header.frame_id = "world"
    tfs.child_frame_id = "turtle1"
    tfs.transform.translation.x = pose.x
    tfs.transform.translation.y = pose.y
    tfs.transform.translation.z = 0.0
    qtn = tf_conversions.transformations.quaternion_from_euler(0.0,0.0,pose.theta)
    tfs.transform.rotation.x = qtn[0]
    tfs.transform.rotation.y = qtn[1]
    tfs.transform.rotation.z = qtn[2]
    tfs.transform.rotation.w = qtn[3]

    pub.sendTransform(tfs)
    rospy.loginfo("%s refer to %s",tfs.child_frame_id,tfs.header.frame_id)

if __name__ == "__main__":
    rospy.init_node("dynamictrasformpubNode")
    rospy.loginfo("dynamictrasformpub info:")
    turtle1posesub = rospy.Subscriber("/turtle1/pose",Pose,doPose,queue_size=100)
    rospy.spin()

