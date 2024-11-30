;; Auto-generated. Do not edit!


(when (boundp 'pubAsub::info)
  (if (not (find-package "PUBASUB"))
    (make-package "PUBASUB"))
  (shadow 'info (find-package "PUBASUB")))
(unless (find-package "PUBASUB::INFO")
  (make-package "PUBASUB::INFO"))

(in-package "ROS")
;;//! \htmlinclude info.msg.html


(defclass pubAsub::info
  :super ros::object
  :slots (_name _count _information ))

(defmethod pubAsub::info
  (:init
   (&key
    ((:name __name) "")
    ((:count __count) 0)
    ((:information __information) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _count (round __count))
   (setq _information (float __information))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:information
   (&optional __information)
   (if __information (setq _information __information)) _information)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; int32 _count
    4
    ;; float32 _information
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32 _count
       (write-long _count s)
     ;; float32 _information
       (sys::poke _information (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _count
     (setq _count (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _information
     (setq _information (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pubAsub::info :md5sum-) "a71ec603c423d658e70d89e317c9473b")
(setf (get pubAsub::info :datatype-) "pubAsub/info")
(setf (get pubAsub::info :definition-)
      "string name
int32 count
float32 information
")



(provide :pubAsub/info "a71ec603c423d658e70d89e317c9473b")


