; Auto-generated. Do not edit!


(cl:in-package pubAsub-msg)


;//! \htmlinclude info.msg.html

(cl:defclass <info> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (count
    :reader count
    :initarg :count
    :type cl:integer
    :initform 0)
   (information
    :reader information
    :initarg :information
    :type cl:float
    :initform 0.0))
)

(cl:defclass info (<info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pubAsub-msg:<info> is deprecated: use pubAsub-msg:info instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pubAsub-msg:name-val is deprecated.  Use pubAsub-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pubAsub-msg:count-val is deprecated.  Use pubAsub-msg:count instead.")
  (count m))

(cl:ensure-generic-function 'information-val :lambda-list '(m))
(cl:defmethod information-val ((m <info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pubAsub-msg:information-val is deprecated.  Use pubAsub-msg:information instead.")
  (information m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <info>) ostream)
  "Serializes a message object of type '<info>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'information))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <info>) istream)
  "Deserializes a message object of type '<info>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'information) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<info>)))
  "Returns string type for a message object of type '<info>"
  "pubAsub/info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'info)))
  "Returns string type for a message object of type 'info"
  "pubAsub/info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<info>)))
  "Returns md5sum for a message object of type '<info>"
  "a71ec603c423d658e70d89e317c9473b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'info)))
  "Returns md5sum for a message object of type 'info"
  "a71ec603c423d658e70d89e317c9473b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<info>)))
  "Returns full string definition for message of type '<info>"
  (cl:format cl:nil "string name~%int32 count~%float32 information~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'info)))
  "Returns full string definition for message of type 'info"
  (cl:format cl:nil "string name~%int32 count~%float32 information~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <info>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <info>))
  "Converts a ROS message object to a list"
  (cl:list 'info
    (cl:cons ':name (name msg))
    (cl:cons ':count (count msg))
    (cl:cons ':information (information msg))
))
