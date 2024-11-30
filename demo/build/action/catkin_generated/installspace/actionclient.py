#!/usr/bin/env python3
import rospy
import actionlib
from action.msg import *

def done_cb(state,result):
    if state == actionlib.GoalStatus.SUCCEEDED:
        rospy.loginfo("action result:%d",result.sum)
    else:
        rospy.logerr("action error!!!")

def active_cb():
    rospy.loginfo("action acive!!!")

def feedback_cb(feedback):
    rospy.loginfo("current process_bar:%.2f",feedback.progress_bar)

if __name__ == "__main__":
    rospy.init_node("actionclientNode")
    rospy.loginfo("actionclient taikwindow:")
    client = actionlib.SimpleActionClient("Addints",addintsAction)
    client.wait_for_server()
    goal_num = addintsGoal()
    goal_num.num = 100
    client.send_goal(goal_num,done_cb,active_cb,feedback_cb)
    rospy.spin()
