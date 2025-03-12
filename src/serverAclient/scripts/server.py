#! /usr/bin/env python
import rospy
from serverAclient.srv import addints,addintsRequest,addintsResponse
# from serverAclient.srv import *

def doNums(request):
    num1 = request.num1
    num2 = request.num2
    sum = num1+num2
    response = addintsResponse()
    response.res = sum
    rospy.loginfo("%d+%d=%d",num1,num2,sum)
    return response

if __name__ == "__main__":
    rospy.init_node("serverNode")
    rospy.loginfo("server generated:")
    server = rospy.Service("Addints",addints,doNums)
    
    rospy.spin()
    