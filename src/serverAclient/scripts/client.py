#! /usr/bin/env python
import rospy
from serverAclient.srv import addints,addintsRequest,addintsResponse
# from serverAclient.srv import *
import sys

if __name__ == "__main__":
    rospy.init_node("clientNode")
    rospy.loginfo("client generated:")
    if(len(sys.argv)!=3):
        rospy.logerr("error argv!")
        sys.exit(1)
    client = rospy.ServiceProxy("Addints",addints)
    
    num1 = int(sys.argv[1])
    num2 = int(sys.argv[2])

    client.wait_for_service()
    # rospy.wait_for_service("Addints")
    try:
        response = client.call(addintsRequest(num1,num2))
        rospy.loginfo("rosponse:%d",response.res)
    except Exception as e:
        rospy.logerr("error response!")
    