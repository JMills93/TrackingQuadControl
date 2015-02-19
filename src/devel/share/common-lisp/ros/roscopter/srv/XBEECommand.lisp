; Auto-generated. Do not edit!


(cl:in-package roscopter-srv)


;//! \htmlinclude XBEECommand-request.msg.html

(cl:defclass <XBEECommand-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0))
)

(cl:defclass XBEECommand-request (<XBEECommand-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <XBEECommand-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'XBEECommand-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roscopter-srv:<XBEECommand-request> is deprecated: use roscopter-srv:XBEECommand-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <XBEECommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roscopter-srv:command-val is deprecated.  Use roscopter-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<XBEECommand-request>)))
    "Constants for message type '<XBEECommand-request>"
  '((:STARTMISSION . 1)
    (:MISSIONFINISHED . 2)
    (:FAILSAFE . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'XBEECommand-request)))
    "Constants for message type 'XBEECommand-request"
  '((:STARTMISSION . 1)
    (:MISSIONFINISHED . 2)
    (:FAILSAFE . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <XBEECommand-request>) ostream)
  "Serializes a message object of type '<XBEECommand-request>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <XBEECommand-request>) istream)
  "Deserializes a message object of type '<XBEECommand-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<XBEECommand-request>)))
  "Returns string type for a service object of type '<XBEECommand-request>"
  "roscopter/XBEECommandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'XBEECommand-request)))
  "Returns string type for a service object of type 'XBEECommand-request"
  "roscopter/XBEECommandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<XBEECommand-request>)))
  "Returns md5sum for a message object of type '<XBEECommand-request>"
  "4092736087ba4328fa7dc96a85fda7a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'XBEECommand-request)))
  "Returns md5sum for a message object of type 'XBEECommand-request"
  "4092736087ba4328fa7dc96a85fda7a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<XBEECommand-request>)))
  "Returns full string definition for message of type '<XBEECommand-request>"
  (cl:format cl:nil "int8 command~%int8 STARTMISSION = 1~%int8 MISSIONFINISHED = 2~%int8 FAILSAFE = 3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'XBEECommand-request)))
  "Returns full string definition for message of type 'XBEECommand-request"
  (cl:format cl:nil "int8 command~%int8 STARTMISSION = 1~%int8 MISSIONFINISHED = 2~%int8 FAILSAFE = 3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <XBEECommand-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <XBEECommand-request>))
  "Converts a ROS message object to a list"
  (cl:list 'XBEECommand-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude XBEECommand-response.msg.html

(cl:defclass <XBEECommand-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass XBEECommand-response (<XBEECommand-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <XBEECommand-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'XBEECommand-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roscopter-srv:<XBEECommand-response> is deprecated: use roscopter-srv:XBEECommand-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <XBEECommand-response>) ostream)
  "Serializes a message object of type '<XBEECommand-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <XBEECommand-response>) istream)
  "Deserializes a message object of type '<XBEECommand-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<XBEECommand-response>)))
  "Returns string type for a service object of type '<XBEECommand-response>"
  "roscopter/XBEECommandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'XBEECommand-response)))
  "Returns string type for a service object of type 'XBEECommand-response"
  "roscopter/XBEECommandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<XBEECommand-response>)))
  "Returns md5sum for a message object of type '<XBEECommand-response>"
  "4092736087ba4328fa7dc96a85fda7a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'XBEECommand-response)))
  "Returns md5sum for a message object of type 'XBEECommand-response"
  "4092736087ba4328fa7dc96a85fda7a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<XBEECommand-response>)))
  "Returns full string definition for message of type '<XBEECommand-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'XBEECommand-response)))
  "Returns full string definition for message of type 'XBEECommand-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <XBEECommand-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <XBEECommand-response>))
  "Converts a ROS message object to a list"
  (cl:list 'XBEECommand-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'XBEECommand)))
  'XBEECommand-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'XBEECommand)))
  'XBEECommand-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'XBEECommand)))
  "Returns string type for a service object of type '<XBEECommand>"
  "roscopter/XBEECommand")