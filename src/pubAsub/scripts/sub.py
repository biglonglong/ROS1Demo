#! /usr/bin/env python
import rospy
from pubAsub.msg import info
# from std_msgs.msg import String

def doMsg(msg):
    rospy.loginfo("received from pub:count-%d,name-%s,infomation-%.2f",msg.count,msg.name,msg.information)

if __name__ == "__main__":
    rospy.init_node("subNode")
    rospy.loginfo("subscriber info:")
    sub = rospy.Subscriber("msgContent",info,doMsg,queue_size=10)
    rospy.spin()
    