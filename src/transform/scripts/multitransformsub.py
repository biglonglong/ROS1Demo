#! /usr/bin/env python
import rospy
import tf2_ros
from geometry_msgs.msg import TransformStamped
from tf2_geometry_msgs import tf2_geometry_msgs


if __name__ == "__main__":
    rospy.init_node("multitrasformsubNode")
    rospy.loginfo("multitrasformsub info:")
    buffer = tf2_ros.Buffer()
    sub = tf2_ros.TransformListener(buffer)

    ps_systemOne = tf2_geometry_msgs.PointStamped()
    ps_systemOne.header.stamp = rospy.Time.now()
    ps_systemOne.header.frame_id = "systemOne"
    ps_systemOne.point.x = 0.0
    ps_systemOne.point.y = 0.0
    ps_systemOne.point.z = 0.0

    rate = rospy.Rate(10)
    # rospy.Duration(3).sleep()
    while not rospy.is_shutdown():
        try:
            ps_systemTwo = buffer.transform(ps_systemOne,"systemTwo",rospy.Duration(0.5))
            rospy.loginfo("-------------------------------------------------------")
            rospy.loginfo("<python>%s position is x:%.2f y:%.2f z:%.2f",
                            ps_systemTwo.header.frame_id,
                            ps_systemTwo.point.x,
                            ps_systemTwo.point.y,
                            ps_systemTwo.point.z)
            
            tfs_One2Two = buffer.lookup_transform("systemTwo","systemOne",rospy.Time(0.0))
            rospy.loginfo("<C++>%s refer to %s:translation(%.2f,%.2f,%.2f),rotation(%.2f,%.2f,%.2f,%.2f)",
                                tfs_One2Two.child_frame_id,
                                tfs_One2Two.header.frame_id,
                                tfs_One2Two.transform.translation.x,
                                tfs_One2Two.transform.translation.y,
                                tfs_One2Two.transform.translation.z,
                                tfs_One2Two.transform.rotation.x,
                                tfs_One2Two.transform.rotation.y,
                                tfs_One2Two.transform.rotation.z,
                                tfs_One2Two.transform.rotation.w
                                )

        except Exception as e:
            rospy.logwarn("error subscribe! about:%s",e)
        rate.sleep()
