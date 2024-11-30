#!/usr/bin/env python3
import rospy
import tf2_ros
from tf2_geometry_msgs import tf2_geometry_msgs

if __name__ == "__main__":
    rospy.init_node("dynamictrasformsubNode")
    rospy.loginfo("dynamictrasformsub info:")
    buffer = tf2_ros.Buffer()
    sub = tf2_ros.TransformListener(buffer)

    ps_laser = tf2_geometry_msgs.PointStamped()
    ps_laser.header.stamp = rospy.Time()
    ps_laser.header.frame_id = "turtle1"
    ps_laser.point.x = 2.0
    ps_laser.point.y = 0.0
    ps_laser.point.z = 5.0

    rate = rospy.Rate(10)
    # rospy.Duration(3).sleep()
    while not rospy.is_shutdown():
        try:
            ps_base = buffer.transform(ps_laser,"world")
            rospy.loginfo("<python>%s position is x:%.2f y:%.2f z:%.2f",
                            ps_base.header.frame_id,
                            ps_base.point.x,
                            ps_base.point.y,
                            ps_base.point.z)
        except Exception as e:
            rospy.logwarn("error subscribe! about:%s",e)
        rate.sleep()
