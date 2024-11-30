#include "ros/ros.h"
#include "actionlib/server/simple_action_server.h"
#include "action/addintsAction.h"

typedef actionlib::SimpleActionServer<action::addintsAction> actionserver;

void sumints(const action::addintsGoalConstPtr& goalPtr, actionserver* as) {
    int goal_num = goalPtr->num;
    ROS_INFO("as for goal->num:%d",goal_num);

    ros::Rate rate(10);
    int sum = 0;
    for(int i=1;i<=goal_num;i++) {
        sum+=i;
        rate.sleep();
        action::addintsFeedback feedback;
        feedback.progress_bar = i /(double)goal_num;
        as->publishFeedback(feedback);
    }

    action::addintsResult res;
    res.sum = sum;
    as->setSucceeded(res);
    ROS_INFO("for goal->num,the result is:%d",res.sum);
}

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"actionserverNode");
    ROS_INFO("actionserver talkwindow:");
    ros::NodeHandle nh;
    actionserver as(nh,"Addints",boost::bind(&sumints,_1,&as),false);
    as.start();

    ros::spin();

    return 0;
}
