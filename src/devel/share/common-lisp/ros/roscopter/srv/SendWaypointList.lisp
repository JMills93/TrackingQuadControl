; Auto-generated. Do not edit!


(cl:in-package roscopter-srv)


;//! \htmlinclude SendWaypointList-request.msg.html

(cl:defclass <SendWaypointList-request> (roslisp-msg-protocol:ros-message)
  ((waypoints
    :reader waypoints
    :initarg :waypoints
    :type (cl:vector roscopter-msg:Waypoint)
   :initform (cl:make-array 0 :element-type 'roscopter-msg:Waypoint :initial-element (cl:make-instance 'roscopter-msg:Waypoint))))
)

(cl:defclass SendWaypointList-request (<SendWaypointList-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendWaypointList-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendWaypointList-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roscopter-srv:<SendWaypointList-request> is deprecated: use roscopter-srv:SendWaypointList-request instead.")))

(cl:ensure-generic-function 'waypoints-val :lambda-list '(m))
(cl:defmethod waypoints-val ((m <SendWaypointList-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roscopter-srv:waypoints-val is deprecated.  Use roscopter-srv:waypoints instead.")
  (waypoints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendWaypointList-request>) ostream)
  "Serializes a message object of type '<SendWaypointList-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'waypoints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'waypoints))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendWaypointList-request>) istream)
  "Deserializes a message object of type '<SendWaypointList-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'waypoints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'waypoints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'roscopter-msg:Waypoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendWaypointList-request>)))
  "Returns string type for a service object of type '<SendWaypointList-request>"
  "roscopter/SendWaypointListRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendWaypointList-request)))
  "Returns string type for a service object of type 'SendWaypointList-request"
  "roscopter/SendWaypointListRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendWaypointList-request>)))
  "Returns md5sum for a message object of type '<SendWaypointList-request>"
  "9944296f2443b43e549ac358efe7dae8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendWaypointList-request)))
  "Returns md5sum for a message object of type 'SendWaypointList-request"
  "9944296f2443b43e549ac358efe7dae8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendWaypointList-request>)))
  "Returns full string definition for message of type '<SendWaypointList-request>"
  (cl:format cl:nil "Waypoint[] waypoints~%~%================================================================================~%MSG: roscopter/Waypoint~%# latitude and longitude given in decimal degrees (* 10^7)~%int32 latitude~%int32 longitude~%~%# height in mm~%int32 altitude~%~%# posAcc given in mm~%uint16 pos_acc~%~%# max speed to travel to waypoint in % of 100~%uint8 speed_to~%~%# time to stay at waypoint in ms~%uint16 hold_time~%~%# yawFrom angle given in degrees (* 1000)~%int32 yaw_from~%~%# camera pan and tilt angles during waypoint travel given in degrees (* 1000)~%int32 pan_angle~%int32 tilt_angle~%~%# Type of Waypoint~%uint8 waypoint_type~%~%uint8 TYPE_NAV = 1~%uint8 TYPE_CONDITION_YAW = 2~%uint8 TYPE_CONDITION_CHANGE_ALT = 3~%uint8 TYPE_TAKEOFF = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendWaypointList-request)))
  "Returns full string definition for message of type 'SendWaypointList-request"
  (cl:format cl:nil "Waypoint[] waypoints~%~%================================================================================~%MSG: roscopter/Waypoint~%# latitude and longitude given in decimal degrees (* 10^7)~%int32 latitude~%int32 longitude~%~%# height in mm~%int32 altitude~%~%# posAcc given in mm~%uint16 pos_acc~%~%# max speed to travel to waypoint in % of 100~%uint8 speed_to~%~%# time to stay at waypoint in ms~%uint16 hold_time~%~%# yawFrom angle given in degrees (* 1000)~%int32 yaw_from~%~%# camera pan and tilt angles during waypoint travel given in degrees (* 1000)~%int32 pan_angle~%int32 tilt_angle~%~%# Type of Waypoint~%uint8 waypoint_type~%~%uint8 TYPE_NAV = 1~%uint8 TYPE_CONDITION_YAW = 2~%uint8 TYPE_CONDITION_CHANGE_ALT = 3~%uint8 TYPE_TAKEOFF = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendWaypointList-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'waypoints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendWaypointList-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendWaypointList-request
    (cl:cons ':waypoints (waypoints msg))
))
;//! \htmlinclude SendWaypointList-response.msg.html

(cl:defclass <SendWaypointList-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SendWaypointList-response (<SendWaypointList-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendWaypointList-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendWaypointList-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roscopter-srv:<SendWaypointList-response> is deprecated: use roscopter-srv:SendWaypointList-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <SendWaypointList-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roscopter-srv:result-val is deprecated.  Use roscopter-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendWaypointList-response>) ostream)
  "Serializes a message object of type '<SendWaypointList-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendWaypointList-response>) istream)
  "Deserializes a message object of type '<SendWaypointList-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendWaypointList-response>)))
  "Returns string type for a service object of type '<SendWaypointList-response>"
  "roscopter/SendWaypointListResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendWaypointList-response)))
  "Returns string type for a service object of type 'SendWaypointList-response"
  "roscopter/SendWaypointListResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendWaypointList-response>)))
  "Returns md5sum for a message object of type '<SendWaypointList-response>"
  "9944296f2443b43e549ac358efe7dae8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendWaypointList-response)))
  "Returns md5sum for a message object of type 'SendWaypointList-response"
  "9944296f2443b43e549ac358efe7dae8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendWaypointList-response>)))
  "Returns full string definition for message of type '<SendWaypointList-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendWaypointList-response)))
  "Returns full string definition for message of type 'SendWaypointList-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendWaypointList-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendWaypointList-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendWaypointList-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendWaypointList)))
  'SendWaypointList-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendWaypointList)))
  'SendWaypointList-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendWaypointList)))
  "Returns string type for a service object of type '<SendWaypointList>"
  "roscopter/SendWaypointList")