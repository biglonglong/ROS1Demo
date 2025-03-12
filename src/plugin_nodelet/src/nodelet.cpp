#include "nodelet/nodelet.h"
#include "pluginlib/class_list_macros.h"
#include "ros/ros.h"
#include "std_msgs/Float64.h"

namespace plugin_nodelet_ns {
class pluginNodelet: public nodelet::Nodelet {
    private:
        ros::Publisher pub;
        ros::Subscriber sub;
        double value;
    public:
        pluginNodelet(){
            value = 0.0;
        }
        void onInit(){
            ros::NodeHandle& nh = getPrivateNodeHandle();
            nh.getParam("value",value);
            pub = nh.advertise<std_msgs::Float64>("out",100);
            sub = nh.subscribe<std_msgs::Float64>("in",100,&pluginNodelet::doCb,this);
        }
        void doCb(const std_msgs::Float64::ConstPtr& p){
            double num = p->data;
            double result = num + value;
            ROS_INFO("result through nodelet is:%.2f",result);
            std_msgs::Float64 res;
            res.data = result;
            pub.publish(res);
        }
  
};
}

PLUGINLIB_EXPORT_CLASS(plugin_nodelet_ns::pluginNodelet,nodelet::Nodelet)
