
(cl:in-package :asdf)

(defsystem "roscopter-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "APMCommand" :depends-on ("_package_APMCommand"))
    (:file "_package_APMCommand" :depends-on ("_package"))
    (:file "SendWaypoint" :depends-on ("_package_SendWaypoint"))
    (:file "_package_SendWaypoint" :depends-on ("_package"))
    (:file "XBEECommand" :depends-on ("_package_XBEECommand"))
    (:file "_package_XBEECommand" :depends-on ("_package"))
    (:file "SendWaypointList" :depends-on ("_package_SendWaypointList"))
    (:file "_package_SendWaypointList" :depends-on ("_package"))
  ))