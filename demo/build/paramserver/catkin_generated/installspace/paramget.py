#!/usr/bin/env python3
import rospy

if __name__ == "__main__":
    rospy.init_node("paramgetNode")

    radius = rospy.get_param("radius",0.05)
    # radius = rospy.get_param_cached("radius",,0.05)
    # result = rospy.has_param("radius")
    # radius = rospy.search_param("radius")
    if radius !=0.05:
        rospy.loginfo("radius:%.2f",radius)
    else:
        rospy.logwarn("nothing about radius")
    
    names = rospy.get_param_names()
    rospy.loginfo("names:")
    for name in names:
        rospy.loginfo("%s",name)