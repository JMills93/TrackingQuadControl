; Auto-generated. Do not edit!


(cl:in-package roscopter-srv)


;//! \htmlinclude SendWaypoint-request.msg.html

(cl:defclass <SendWaypoint-request> (roslisp-msg-protocol:ros-message)
  ((waypoint
    :reader waypoint
    :initarg :waypoint
    :type roscopter-msg:Waypoint
    :initform (cl:make-instance 'roscopter-msg:Waypoint)))
)

(cl:defclass SendWaypoint-request (<SendWaypoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendWaypoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendWaypoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roscopter-srv:<SendWaypoint-request> is deprecated: use roscopter-srv:SendWaypoint-request instead.")))

(cl:ensure-generic-function 'waypoint-val :lambda-list '(m))
(cl:defmethod waypoint-val ((m <SendWaypoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roscopter-srv:waypoint-val is deprecated.  Use roscopter-srv:waypoint instead.")
  (waypoint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendWaypoint-request>) ostream)
  "Serializes a message object of type '<SendWaypoint-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'waypoint) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendWaypoint-request>) istream)
  "Deserializes a message object of type '<SendWaypoint-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'waypoint) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendWaypoint-request>)))
  "Returns string type for a service object of type '<SendWaypoint-request>"
  "roscopter/SendWaypointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendWaypoint-request)))
  "Returns string type for a service object of type 'SendWaypoint-request"
  "roscopter/SendWaypointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendWaypoint-request>)))
  "Returns md5sum for a message object of type '<SendWaypoint-request>"
  "e5f60840a7c8257ef80f2e79965e13d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendWaypoint-request)))
  "Returns md5sum for a message object of type 'SendWaypoint-request"
  "e5f60840a7c8257ef80f2e79965e13d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendWaypoint-request>)))
  "Returns full string definition for message of type '<SendWaypoint-request>"
  (cl:format cl:nil "Waypoint waypoint~%~%================================================================================~%MSG: roscopter/Waypoint~%# latitude and longitude given in decimal degrees (* 10^7)~%int32 latitude~%int32 longitude~%~%# height in mm~%int32 altitude~%~%# posAcc given in mm~%uint16 pos_acc~%~%# max speed to travel to waypoint in % of 100~%uint8 speed_to~%~%# time to stay at waypoint in ms~%uint16 hold_time~%~%# yawFrom angle given in degrees (* 1000)~%int32 yaw_from~%~%# camera pan and tilt angles during waypoint travel given in degrees (* 1000)~%int32 pan_angle~%int32 tilt_angle~%~%# Type of Waypoint~%uint8 waypoint_type~%~%uint8 TYPE_NAV = 1~%uint8 TYPE_CONDITION_YAW = 2~%uint8 TYPE_CONDITION_CHANGE_ALT = 3~%uint8 TYPE_TAKEOFF = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendWaypoint-request)))
  "Returns full string definition for message of type 'SendWaypoint-request"
  (cl:format cl:nil "Waypoint waypoint~%~%================================================================================~%MSG: roscopter/Waypoint~%# latitude and longitude given in decimal degrees (* 10^7)~%int32 latitude~%int32 longitude~%~%# height in mm~%int32 altitude~%~%# posAcc given in mm~%uint16 pos_acc~%~%# max speed to travel to waypoint in % of 100~%uint8 speed_to~%~%# time to stay at waypoint in ms~%uint16 hold_time~%~%# yawFrom angle given in degrees (* 1000)~%int32 yaw_from~%~%# camera pan and tilt angles during waypoint travel given in degrees (* 1000)~%int32 pan_angle~%int32 tilt_angle~%~%# Type of Waypoint~%uint8 waypoint_type~%~%uint8 TYPE_NAV = 1~%uint8 TYPE_CONDITION_YAW = 2~%uint8 TYPE_CONDITION_CHANGE_ALT = 3~%uint8 TYPE_TAKEOFF = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendWaypoint-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'waypoint))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendWaypoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendWaypoint-request
    (cl:cons ':waypoint (waypoint msg))
))
;//! \htmlinclude SendWaypoint-response.msg.html

(cl:defclass <SendWaypoint-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SendWaypoint-response (<SendWaypoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendWaypoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendWaypoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roscopter-srv:<SendWaypoint-response> is deprecated: use roscopter-srv:SendWaypoint-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <SendWaypoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roscopter-srv:result-val is deprecated.  Use roscopter-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendWaypoint-response>) ostream)
  "Serializes a message object of type '<SendWaypoint-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendWaypoint-response>) istream)
  "Deserializes a message object of type '<SendWaypoint-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendWaypoint-response>)))
  "Returns string type for a service object of type '<SendWaypoint-response>"
  "roscopter/SendWaypointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendWaypoint-response)))
  "Returns string type for a service object of type 'SendWaypoint-response"
  "roscopter/SendWaypointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendWaypoint-response>)))
  "Returns md5sum for a message object of type '<SendWaypoint-response>"
  "e5f60840a7c8257ef80f2e79965e13d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendWaypoint-response)))
  "Returns md5sum for a message object of type 'SendWaypoint-response"
  "e5f60840a7c8257ef80f2e79965e13d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendWaypoint-response>)))
  "Returns full string definition for message of type '<SendWaypoint-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendWaypoint-response)))
  "Returns full string definition for message of type 'SendWaypoint-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendWaypoint-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendWaypoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendWaypoint-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendWaypoint)))
  'SendWaypoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendWaypoint)))
  'SendWaypoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendWaypoint)))
  "Returns string type for a service object of type '<SendWaypoint>"
  "roscopter/SendWaypoint")