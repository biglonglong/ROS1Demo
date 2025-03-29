# ROS1demo
referencing [ROS | autolabor](http://www.autolabor.com.cn/book/ROSTutorials/)

```txt
└───src
    ├───helloworld
    ├───pubAsub
    ├───serverAclient
    ├───paramserver
    ├───action
    ├───study
    ├───bag
    ├───transform
    ├───simulation
    ├───nav
    ├───dynamicparam
    ├───plugin
    └───plugin_nodelet
```



## 工具命令

- node

```shell
rosnode list
rosnode info
```

- Topic communication: publish and subscribe

```shell
rqt_graph | rostopic list                                      # get <TOPIC_NAME>
rostopic info <TOPIC_NAME>                                     # get <TOPIC_TYPE>
rostopic find <TOPIC_TYPE>									   # get accurate <TOPIC_NAME>
rosmsg info <TOPIC_TYPE>                                       # get accurate <TOPIC_FORMAT>
rostopic echo <TOPIC_NAME>                                     # test1
rostopic pub -r <NUM> <TOPIC_NAME> <Tab x2>                    # test2

rosmsg package <PACKAGE_NAME>								   # get <TOPIC_FORMAT>
```

- Service communication: request and response

```shell
rqt_graph\rostservice list                                     # get <SERVICE_NAME>
rosservice info <SERVICE_NAME>                                 # get <SERVICE_TYPE> 
rosservice find <SERVICE_TYPE>						     	   # get accurate <SERVICE_NAME>
rossrv info <SERVICE_TYPE>                                     # get <SERVICE_FORMAT>
rosservice call <SERVICE_NAME> <Tab>                           # test1

rossrv package <PACKAGE_NAME>								   # get  <SERVICE_FORMAT>
```

- Parameter server: parameter sharing

```shell
rqt_graph | rostparam list                                     # index <PARAM_NAME>
rosparam get <PARAM_NAME>                                      # get <PARAM_VALUE>
rosparam set <PARAM_NAME> <Tab>  ||rosrun || launchFile        # set <PARAM_NAME>
```

- tf：坐标转换关系可视化

```shell
rosrun tf2_tools view_frames.py
```

- urdf/xacro：机器人仿真文件生成与检查

```shell
rosrun xacro xacro xxx.xacro > xxx.urdf
check_urdf xxx.urdf
urdf_to_graphiz xxx.urdf
```

- rosbag：ros仿真记录

```shell
rosbag record -a -O <file> 
rosbag info <file>
rosbag play <file>
```
