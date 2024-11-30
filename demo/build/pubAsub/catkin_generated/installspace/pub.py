#!/usr/bin/env python3
import rospy
from pubAsub.msg import info
# from std_msgs.msg import String

if __name__ == "__main__":
    rospy.init_node("pubNode")
    rospy.loginfo("publisher info:")
    pub = rospy.Publisher("msgContent",info,queue_size=10,latch=False)

    msg = info()
    msg.name = "minilele"
    msg.information = 1.4
    msg.count = 0
    # msg = String()
    # msg_front = "std_msg"
    # count =0

    rate = rospy.Rate(1)
    rospy.sleep(3)
    while not rospy.is_shutdown():
        msg.count+=1
        # count+=1
        # msg.data = msg_front + str(count)
        if msg.count>1000:
            rospy.signal_shutdown("enough messages published!")
        pub.publish(msg)
        rospy.loginfo("publishd to sub:%d",msg.count)
        rate.sleep()
