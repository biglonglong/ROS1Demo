#!/usr/bin/env python3
import rospy
import actionlib
from action.msg import *

class MyActionServer:
    def __init__(self):
        self.server = actionlib.SimpleActionServer("Addints",addintsAction,self.sumints,False)
        self.server.start()

    def sumints(self,goal):
        goal_num=goal.num
        rospy.loginfo("as for goal->num:%d",goal_num)
        rate = rospy.Rate(10)
        sum = 0
        for i in range(1,goal_num + 1):
            sum = sum + i
            rate.sleep()
            feedback = addintsFeedback()
            feedback.progress_bar = i / goal_num
            self.server.publish_feedback(feedback)

        res = addintsResult()
        res.sum = sum        
        self.server.set_succeeded(res)
        rospy.loginfo("for goal->num,the result is:%d",res.sum)

if __name__ == "__main__":
    rospy.init_node("actionserverNode")
    rospy.loginfo("actionserver taikwindow:")
    server = MyActionServer()
    rospy.spin()
