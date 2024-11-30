#include "ros/ros.h"
#include "helloworld/hello.h"

void doSomeThing(const ros::TimerEvent& event) {
    ROS_INFO("event:%s",std::to_string(event.current_real.toSec()).c_str());
}

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"hellovscode_c_node");
    ros::NodeHandle nh;
    ROS_INFO("hello vscode! <from C++>");

    //时刻
    ros::Time t1(100,100000000);
    ROS_INFO("t1时刻:%.2f",t1.toSec());
    ros::Time t2(100.3);
    ROS_INFO("t2时刻:%.2f",t2.toSec());

    //频率
    ros::Rate rate(6);
    int count = 0;
    while(true) {
        count++;
        if(count>25) {
            break;
        }
        ROS_INFO("-----------code:%d----------",count);
        ros::Time right_now = ros::Time::now();
        ROS_INFO("当前时刻:%.2f",right_now.toSec());
        // ROS_INFO("当前时刻:%d",right_now.sec);
        rate.sleep();
    }

    // 头文件
    hello_ns::HelloPub helloPub;
    helloPub.run();

    //时间和定时器
    ros::Duration du(3.0);
    ROS_INFO("持续时间<%.2f>后开启定时器:",du.toSec());
    du.sleep();
    ros::Timer timer = nh.createTimer(ros::Duration(1.0),doSomeThing,false,false);
    timer.start();
    ros::spin();

    return 0;
}
