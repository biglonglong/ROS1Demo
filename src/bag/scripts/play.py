#! /usr/bin/env python
import rospy
import rosbag
from std_msgs.msg import String

if __name__ == "__main__":
    rospy.init_node("rplayNode")
    rospy.loginfo("play...")
    bag = rosbag.Bag("./src/bag/hello.bag",'r')

    bagMsg = bag.read_messages("chatter")
    for topic,msg,time in bagMsg:
        rospy.loginfo("topic:%s,time:%s,msgs:%s",topic,time,msg)
    bag.close()