#include "ros/ros.h"
#include "actionlib/client/simple_action_client.h"
#include "action/addintsAction.h"

typedef actionlib::SimpleActionClient<action::addintsAction> actionclient;

void done_cb(const actionlib::SimpleClientGoalState &state, const action::addintsResultConstPtr &result) {
    if(state.state_ == state.SUCCEEDED) {
        ROS_INFO("action result:%d",result->sum);
    } else {
        ROS_ERROR("action error!!!");
    }
}

void active_cb() {
    ROS_INFO("action acive!!!");
}

void feedback_cb(const action::addintsFeedbackConstPtr &feedback) {
    ROS_INFO("current process_bar:%.2f",feedback->progress_bar);
}

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"actionclientNode");
    ROS_INFO("actionclient talkwindow:");
    ros::NodeHandle nh;
    actionclient ac(nh,"Addints");

    ac.waitForServer();
    action::addintsGoal goal_num;
    goal_num.num = 100;
    ac.sendGoal(goal_num,&done_cb,&active_cb,&feedback_cb);
 
    ros::spin();

    return 0;
}
