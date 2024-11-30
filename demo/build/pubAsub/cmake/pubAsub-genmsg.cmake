# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pubAsub: 1 messages, 0 services")

set(MSG_I_FLAGS "-IpubAsub:/home/biglonglong/demo/src/pubAsub/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pubAsub_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/biglonglong/demo/src/pubAsub/msg/info.msg" NAME_WE)
add_custom_target(_pubAsub_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pubAsub" "/home/biglonglong/demo/src/pubAsub/msg/info.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pubAsub
  "/home/biglonglong/demo/src/pubAsub/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pubAsub
)

### Generating Services

### Generating Module File
_generate_module_cpp(pubAsub
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pubAsub
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pubAsub_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pubAsub_generate_messages pubAsub_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/biglonglong/demo/src/pubAsub/msg/info.msg" NAME_WE)
add_dependencies(pubAsub_generate_messages_cpp _pubAsub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pubAsub_gencpp)
add_dependencies(pubAsub_gencpp pubAsub_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pubAsub_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pubAsub
  "/home/biglonglong/demo/src/pubAsub/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pubAsub
)

### Generating Services

### Generating Module File
_generate_module_eus(pubAsub
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pubAsub
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pubAsub_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pubAsub_generate_messages pubAsub_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/biglonglong/demo/src/pubAsub/msg/info.msg" NAME_WE)
add_dependencies(pubAsub_generate_messages_eus _pubAsub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pubAsub_geneus)
add_dependencies(pubAsub_geneus pubAsub_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pubAsub_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pubAsub
  "/home/biglonglong/demo/src/pubAsub/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pubAsub
)

### Generating Services

### Generating Module File
_generate_module_lisp(pubAsub
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pubAsub
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pubAsub_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pubAsub_generate_messages pubAsub_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/biglonglong/demo/src/pubAsub/msg/info.msg" NAME_WE)
add_dependencies(pubAsub_generate_messages_lisp _pubAsub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pubAsub_genlisp)
add_dependencies(pubAsub_genlisp pubAsub_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pubAsub_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pubAsub
  "/home/biglonglong/demo/src/pubAsub/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pubAsub
)

### Generating Services

### Generating Module File
_generate_module_nodejs(pubAsub
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pubAsub
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pubAsub_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pubAsub_generate_messages pubAsub_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/biglonglong/demo/src/pubAsub/msg/info.msg" NAME_WE)
add_dependencies(pubAsub_generate_messages_nodejs _pubAsub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pubAsub_gennodejs)
add_dependencies(pubAsub_gennodejs pubAsub_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pubAsub_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pubAsub
  "/home/biglonglong/demo/src/pubAsub/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pubAsub
)

### Generating Services

### Generating Module File
_generate_module_py(pubAsub
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pubAsub
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pubAsub_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pubAsub_generate_messages pubAsub_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/biglonglong/demo/src/pubAsub/msg/info.msg" NAME_WE)
add_dependencies(pubAsub_generate_messages_py _pubAsub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pubAsub_genpy)
add_dependencies(pubAsub_genpy pubAsub_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pubAsub_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pubAsub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pubAsub
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pubAsub_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pubAsub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pubAsub
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pubAsub_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pubAsub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pubAsub
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pubAsub_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pubAsub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pubAsub
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pubAsub_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pubAsub)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pubAsub\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pubAsub
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pubAsub_generate_messages_py std_msgs_generate_messages_py)
endif()
