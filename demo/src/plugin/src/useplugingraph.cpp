#include <pluginlib/class_loader.h>
#include <plugin/basegraph.h>

int main(int argc, char** argv) {


  pluginlib::ClassLoader<basegraph_ns::Basegraph> loader("plugin", "basegraph_ns::Basegraph");

  try {
    boost::shared_ptr<basegraph_ns::Basegraph> triangle = loader.createInstance("plugingraph_ns::plugin_triangle");
    triangle->init(10.0);
    ROS_INFO("Triangle C: %.2f", triangle->getlength());
    boost::shared_ptr<basegraph_ns::Basegraph> square = loader.createInstance("plugingraph_ns::plugin_square");
    square->init(10.0);
    ROS_INFO("Square C: %.2f", square->getlength());
  }
  catch(pluginlib::PluginlibException& ex) {
    ROS_ERROR("The plugin failed to load for some reason. Error: %s", ex.what());
  }

  return 0;
}
