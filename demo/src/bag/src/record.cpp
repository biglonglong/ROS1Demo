#include "ros/ros.h"
#include "rosbag/bag.h"
#include "std_msgs/String.h"

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"recordNode");
    ROS_INFO("record...");
    ros::NodeHandle nh;
    rosbag::Bag bag;
    
    bag.open("./src/bag/hello.bag",rosbag::BagMode::Write);
    std_msgs::String msg;
    msg.data = "hello world<C++>";
    
    bag.write("chatter",ros::Time::now(),msg);
    bag.write("chatter",ros::Time::now(),msg);
    bag.write("chatter",ros::Time::now(),msg);
    bag.write("chatter",ros::Time::now(),msg);
    bag.write("chatter",ros::Time::now(),msg);
    bag.write("chatter",ros::Time::now(),msg);
    bag.close();

    return 0;
}
