#include "ros/ros.h"
#include "dynamic_reconfigure/server.h"
#include "dynamicparam/drConfig.h"

void cb(dynamicparam::drConfig& config, uint32_t level) {
    ROS_INFO("int_param:%d",config.int_param);
    ROS_INFO("double_param:%.2f",config.double_param);
    ROS_INFO("bool_param:%d",config.bool_param);
    ROS_INFO("str_param:%s",config.str_param.c_str());
    ROS_INFO("list_param:%d\n",config.list_param);
}

int main(int argc, char *argv[]) {
    setlocale(LC_ALL,"");

    ros::init(argc,argv,"drNode");
    ROS_INFO("dr info:");
    dynamic_reconfigure::Server<dynamicparam::drConfig> drserver;
    drserver.setCallback(boost::bind(&cb,_1,_2));

    ros::spin();

    return 0;
}
