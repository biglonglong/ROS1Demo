#!/usr/bin/env python3
import rospy
import os
import sys
path = os.path.abspath(".")
sys.path.insert(0,path + "/src/helloworld/scripts")
import tools

def doMsg(event):
    rospy.loginfo("当前时刻:%s",str(event.current_real))

if __name__ == "__main__":
    rospy.init_node("hellovscode_p_node")
    rospy.loginfo("hello vscode! <from python>")

    # 时刻
    t1 = rospy.Time(1234.567891011)
    t2 = rospy.Time(1234,567891011)
    t3 = rospy.Time.from_sec(543.21)
    rospy.loginfo("t1时刻:%.2f",t1.to_sec())
    rospy.loginfo("t2时刻:%.2f",t2.to_sec())
    rospy.loginfo("t3时刻:%.2f",t3.to_sec())

    # 频率
    rate = rospy.Rate(6)
    count = 0
    while True:
        count+=1
        if count>25:
            break
        rospy.loginfo("-----------code:%d----------",count)
        right_now = rospy.Time.now()
        rospy.loginfo("当前时刻:%.2f",right_now.to_sec())
        # rospy.loginfo("当前时刻:%.2f",right_now.to_nsec())
        rate.sleep()

    # 头文件
    rospy.loginfo("running headFile...  --->%d",tools.num)

    # 时间和定时器
    du = rospy.Duration(3.0)
    rospy.loginfo("持续时间<%.2f>后开启定时器:",du.to_sec())
    rospy.sleep(du)
    rospy.Timer(rospy.Duration(1),doMsg,False)
    rospy.spin()
