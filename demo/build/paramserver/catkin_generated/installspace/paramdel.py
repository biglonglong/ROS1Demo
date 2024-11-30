#!/usr/bin/env python3
import rospy

if __name__ == "__main__":
    rospy.init_node("paramdelNode")
    
    try:
        rospy.delete_param("radius")
        rospy.loginfo("del success!")
    except Exception as e:
        rospy.logerr("del failed!")