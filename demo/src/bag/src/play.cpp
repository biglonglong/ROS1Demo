#include "ros/ros.h"
#include "rosbag/bag.h"
#include "rosbag/view.h"
#include "std_msgs/String.h"
#include "std_msgs/Int32.h"

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"playNode");
    ROS_INFO("play...");
    ros::NodeHandle nh;
    rosbag::Bag bag;
    
    bag.open("./src/bag/hello.bag",rosbag::BagMode::Read);
    for (auto&& m : rosbag::View(bag))
    {
        std::string topic = m.getTopic();
        ros::Time time = m.getTime();
        std_msgs::String::ConstPtr p = m.instantiate<std_msgs::String>();
        if(p != nullptr){
            ROS_INFO("topic:%s,time:%.2f,msgs:%s",topic.c_str(),time.toSec(),p->data.c_str());
        }
    }
    bag.close();

    return 0;
}
