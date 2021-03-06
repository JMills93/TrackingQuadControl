; Auto-generated. Do not edit!


(cl:in-package roscopter-srv)


;//! \htmlinclude APMCommand-request.msg.html

(cl:defclass <APMCommand-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0))
)

(cl:defclass APMCommand-request (<APMCommand-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APMCommand-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APMCommand-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roscopter-srv:<APMCommand-request> is deprecated: use roscopter-srv:APMCommand-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <APMCommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roscopter-srv:command-val is deprecated.  Use roscopter-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<APMCommand-request>)))
    "Constants for message type '<APMCommand-request>"
  '((:CMD_LAUNCH . 1)
    (:CMD_LAND . 2)
    (:CMD_ARM . 3)
    (:CMD_DISARM . 4)
    (:CMD_SET_MANUAL . 5)
    (:CMD_SET_HOLD . 6)
    (:CMD_SET_STABILIZE . 7)
    (:CMD_SET_ALT_HOLD . 8)
    (:CMD_SET_AUTO . 9)
    (:CMD_SET_LOITER . 10)
    (:CMD_SET_LAND . 11)
    (:RETURN_RC_CONTROL . 12))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'APMCommand-request)))
    "Constants for message type 'APMCommand-request"
  '((:CMD_LAUNCH . 1)
    (:CMD_LAND . 2)
    (:CMD_ARM . 3)
    (:CMD_DISARM . 4)
    (:CMD_SET_MANUAL . 5)
    (:CMD_SET_HOLD . 6)
    (:CMD_SET_STABILIZE . 7)
    (:CMD_SET_ALT_HOLD . 8)
    (:CMD_SET_AUTO . 9)
    (:CMD_SET_LOITER . 10)
    (:CMD_SET_LAND . 11)
    (:RETURN_RC_CONTROL . 12))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APMCommand-request>) ostream)
  "Serializes a message object of type '<APMCommand-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APMCommand-request>) istream)
  "Deserializes a message object of type '<APMCommand-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APMCommand-request>)))
  "Returns string type for a service object of type '<APMCommand-request>"
  "roscopter/APMCommandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APMCommand-request)))
  "Returns string type for a service object of type 'APMCommand-request"
  "roscopter/APMCommandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APMCommand-request>)))
  "Returns md5sum for a message object of type '<APMCommand-request>"
  "a0da65f8b813c6736761742ef711a1d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APMCommand-request)))
  "Returns md5sum for a message object of type 'APMCommand-request"
  "a0da65f8b813c6736761742ef711a1d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APMCommand-request>)))
  "Returns full string definition for message of type '<APMCommand-request>"
  (cl:format cl:nil "uint8 command~%uint8 CMD_LAUNCH = 1~%uint8 CMD_LAND = 2~%uint8 CMD_ARM = 3~%uint8 CMD_DISARM = 4~%uint8 CMD_SET_MANUAL = 5~%uint8 CMD_SET_HOLD = 6~%uint8 CMD_SET_STABILIZE = 7~%uint8 CMD_SET_ALT_HOLD = 8~%uint8 CMD_SET_AUTO = 9~%uint8 CMD_SET_LOITER = 10~%uint8 CMD_SET_LAND = 11~%uint8 RETURN_RC_CONTROL = 12~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APMCommand-request)))
  "Returns full string definition for message of type 'APMCommand-request"
  (cl:format cl:nil "uint8 command~%uint8 CMD_LAUNCH = 1~%uint8 CMD_LAND = 2~%uint8 CMD_ARM = 3~%uint8 CMD_DISARM = 4~%uint8 CMD_SET_MANUAL = 5~%uint8 CMD_SET_HOLD = 6~%uint8 CMD_SET_STABILIZE = 7~%uint8 CMD_SET_ALT_HOLD = 8~%uint8 CMD_SET_AUTO = 9~%uint8 CMD_SET_LOITER = 10~%uint8 CMD_SET_LAND = 11~%uint8 RETURN_RC_CONTROL = 12~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APMCommand-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APMCommand-request>))
  "Converts a ROS message object to a list"
  (cl:list 'APMCommand-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude APMCommand-response.msg.html

(cl:defclass <APMCommand-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass APMCommand-response (<APMCommand-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APMCommand-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APMCommand-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roscopter-srv:<APMCommand-response> is deprecated: use roscopter-srv:APMCommand-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <APMCommand-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roscopter-srv:result-val is deprecated.  Use roscopter-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APMCommand-response>) ostream)
  "Serializes a message object of type '<APMCommand-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APMCommand-response>) istream)
  "Deserializes a message object of type '<APMCommand-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APMCommand-response>)))
  "Returns string type for a service object of type '<APMCommand-response>"
  "roscopter/APMCommandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APMCommand-response)))
  "Returns string type for a service object of type 'APMCommand-response"
  "roscopter/APMCommandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APMCommand-response>)))
  "Returns md5sum for a message object of type '<APMCommand-response>"
  "a0da65f8b813c6736761742ef711a1d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APMCommand-response)))
  "Returns md5sum for a message object of type 'APMCommand-response"
  "a0da65f8b813c6736761742ef711a1d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APMCommand-response>)))
  "Returns full string definition for message of type '<APMCommand-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APMCommand-response)))
  "Returns full string definition for message of type 'APMCommand-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APMCommand-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APMCommand-response>))
  "Converts a ROS message object to a list"
  (cl:list 'APMCommand-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'APMCommand)))
  'APMCommand-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'APMCommand)))
  'APMCommand-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APMCommand)))
  "Returns string type for a service object of type '<APMCommand>"
  "roscopter/APMCommand")