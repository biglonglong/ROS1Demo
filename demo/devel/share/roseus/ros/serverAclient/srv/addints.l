;; Auto-generated. Do not edit!


(when (boundp 'serverAclient::addints)
  (if (not (find-package "SERVERACLIENT"))
    (make-package "SERVERACLIENT"))
  (shadow 'addints (find-package "SERVERACLIENT")))
(unless (find-package "SERVERACLIENT::ADDINTS")
  (make-package "SERVERACLIENT::ADDINTS"))
(unless (find-package "SERVERACLIENT::ADDINTSREQUEST")
  (make-package "SERVERACLIENT::ADDINTSREQUEST"))
(unless (find-package "SERVERACLIENT::ADDINTSRESPONSE")
  (make-package "SERVERACLIENT::ADDINTSRESPONSE"))

(in-package "ROS")





(defclass serverAclient::addintsRequest
  :super ros::object
  :slots (_num1 _num2 ))

(defmethod serverAclient::addintsRequest
  (:init
   (&key
    ((:num1 __num1) 0)
    ((:num2 __num2) 0)
    )
   (send-super :init)
   (setq _num1 (round __num1))
   (setq _num2 (round __num2))
   self)
  (:num1
   (&optional __num1)
   (if __num1 (setq _num1 __num1)) _num1)
  (:num2
   (&optional __num2)
   (if __num2 (setq _num2 __num2)) _num2)
  (:serialization-length
   ()
   (+
    ;; int32 _num1
    4
    ;; int32 _num2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _num1
       (write-long _num1 s)
     ;; int32 _num2
       (write-long _num2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _num1
     (setq _num1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _num2
     (setq _num2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass serverAclient::addintsResponse
  :super ros::object
  :slots (_res ))

(defmethod serverAclient::addintsResponse
  (:init
   (&key
    ((:res __res) 0)
    )
   (send-super :init)
   (setq _res (round __res))
   self)
  (:res
   (&optional __res)
   (if __res (setq _res __res)) _res)
  (:serialization-length
   ()
   (+
    ;; int32 _res
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _res
       (write-long _res s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _res
     (setq _res (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass serverAclient::addints
  :super ros::object
  :slots ())

(setf (get serverAclient::addints :md5sum-) "38486e151d36f54c3341e517d9e88650")
(setf (get serverAclient::addints :datatype-) "serverAclient/addints")
(setf (get serverAclient::addints :request) serverAclient::addintsRequest)
(setf (get serverAclient::addints :response) serverAclient::addintsResponse)

(defmethod serverAclient::addintsRequest
  (:response () (instance serverAclient::addintsResponse :init)))

(setf (get serverAclient::addintsRequest :md5sum-) "38486e151d36f54c3341e517d9e88650")
(setf (get serverAclient::addintsRequest :datatype-) "serverAclient/addintsRequest")
(setf (get serverAclient::addintsRequest :definition-)
      "int32 num1
int32 num2
---
int32 res
")

(setf (get serverAclient::addintsResponse :md5sum-) "38486e151d36f54c3341e517d9e88650")
(setf (get serverAclient::addintsResponse :datatype-) "serverAclient/addintsResponse")
(setf (get serverAclient::addintsResponse :definition-)
      "int32 num1
int32 num2
---
int32 res
")



(provide :serverAclient/addints "38486e151d36f54c3341e517d9e88650")


