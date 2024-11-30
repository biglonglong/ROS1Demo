#!/usr/bin/env python3
import rospy
import rosbag
from std_msgs.msg import String

if __name__ == "__main__":
    rospy.init_node("recordNode")
    rospy.loginfo("record...")
    bag = rosbag.Bag("./src/bag/hello.bag",'w')

    s = String()
    s.data = "hello world<python>"

    bag.write("chatter",s)
    bag.write("chatter",s)
    bag.write("chatter",s)
    bag.write("chatter",s)
    bag.write("chatter",s)
    bag.write("chatter",s)
    bag.close()