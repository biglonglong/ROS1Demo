#!/usr/bin/env python3
import rospy

if __name__ == "__main__":
    rospy.init_node("paramsetNode")

    radius = 0.75
    rospy.set_param("radius",radius)
    rospy.loginfo("radius:%.2f",radius)
