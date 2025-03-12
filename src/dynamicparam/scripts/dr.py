#! /usr/bin/env python
import rospy
from dynamic_reconfigure.server import Server
from dynamicparam.cfg import drConfig

def cb(config,level):
    rospy.loginfo("int_param:%d",config.int_param)
    rospy.loginfo("double_param:%.2f",config.double_param)
    rospy.loginfo("bool_param:%d",config.bool_param)
    rospy.loginfo("str_param:%s",config.str_param)
    rospy.loginfo("list_param:%d",config.list_param)
    return config

if __name__ == "__main__":
    rospy.init_node("drNode")
    rospy.loginfo("dr info:")
    drserver = Server(drConfig,cb)
    rospy.spin()
    