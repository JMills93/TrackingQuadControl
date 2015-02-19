__author__ = 'Jay Mills'
#defines a class that can recieve ros_vrpn_client positions

import tf
import rospy
from geometry_msgs.msg import TransformStamped
import math

class RigidBody(object):

    #other static variables
    first_time = True
    name = ""
    #update_rate = 100

    # position information variables, units:cm
    pos_x = 0
    pos_y = 0
    pos_z = 0
    roll = 0
    pitch = 0
    yaw = 0

    # rigid body data, units:cm
    rigid_body_x = 0
    rigid_body_y = 0
    rigid_body_z = 0
    rigid_body_pitch = 0
    rigid_body_roll = 0
    rigid_body_yaw = 0

    # position data from previous loop, units:cm
    old_pos_x = 0
    old_pos_y = 0
    old_pos_z = 0
    old_yaw = 0
    old_pitch = 0
    old_roll = 0

    def __init__(self, rigid_body_name, tracker):
        #name should be in the format "/name/pose"
        self.name = rigid_body_name
        self.tracker = tracker

        # initialises the tracking node
        rospy.init_node('roscopter')
        rospy.Rate(100)
        rospy.Subscriber("/" + self.name + "/pose", TransformStamped, self.get_rigid_body)

    # gets position and orientation data from ros_vrpn_client
    def get_rigid_body(self, rigid_body_msg):

        if self.tracker == "Optitrack":

            # linear position measurments and convert to cm
            self.rigid_body_x = (rigid_body_msg.transform.translation.x * 100)
            self.rigid_body_y = (rigid_body_msg.transform.translation.y * 100)
            self.rigid_body_z = (rigid_body_msg.transform.translation.z * 100)

            # gets quaternion measurments
            rx = rigid_body_msg.transform.rotation.x
            ry = rigid_body_msg.transform.rotation.y
            rz = rigid_body_msg.transform.rotation.z
            rw = rigid_body_msg.transform.rotation.w

            # converts from quaternions to euler measurments
            (temp_roll, temp_pitch, temp_yaw) = tf.transformations.euler_from_quaternion(
                [rx, ry, rz, rw])

            self.rigid_body_roll = temp_roll * 180 / 3.14159
            self.rigid_body_pitch = temp_pitch * 180 / 3.14159
            self.rigid_body_yaw = temp_yaw * 180 / 3.14159

        elif self.tracker == "Vicon":
            # linear position measurments and convert to cm
            self.rigid_body_x = (rigid_body_msg.transform.translation.x * 100)
            self.rigid_body_y = (rigid_body_msg.transform.translation.z * 100)
            self.rigid_body_z = -(rigid_body_msg.transform.translation.y * 100)

            # gets quaternion measurments
            ry = rigid_body_msg.transform.rotation.x
            rx = rigid_body_msg.transform.rotation.y
            rz = rigid_body_msg.transform.rotation.z
            rw = rigid_body_msg.transform.rotation.w

            #works out roll, pitch, yaw measurments
            temp_yaw = math.atan2(2.0*(ry*rz + rw*rx), rw*rw - rx*rx - ry*ry + rz*rz)
            temp_roll = math.asin(-2.0*(rx*rz - rw*ry))
            temp_pitch = -math.atan2(2.0*(rx*ry + rw*rz), rw*rw + rx*rx - ry*ry - rz*rz)
            self.rigid_body_yaw = temp_yaw
            self.rigid_body_pitch = temp_pitch
            self.rigid_body_roll = temp_roll

        # limits yaw inputs
        if self.rigid_body_yaw > 3.14159:
            self.rigid_body_yaw = self.rigid_body_yaw - (3.14159*2)
        if self.rigid_body_yaw < -3.14159:
            self.rigid_body_yaw = self.rigid_body_yaw + (3.14159*2)
        # converts yaw into degrees



    # updates current and old position values
    def update_pos_values(self):

        # updates the position values of the rigid body, and stores old values, units:cm
        if self.first_time:
            self.first_time = False
            self.old_pos_x = self.rigid_body_x
            self.old_pos_y = self.rigid_body_y
            self.old_pos_z = self.rigid_body_z
            self.old_yaw = self.rigid_body_yaw
            self.old_roll = self.rigid_body_roll
            self.old_pitch = self.rigid_body_pitch
            self.pos_x = self.rigid_body_x
            self.pos_y = self.rigid_body_y
            self.pos_z = self.rigid_body_z
            self.yaw = self.rigid_body_yaw
            self.roll = self.rigid_body_roll
            self.pitch = self.rigid_body_pitch
        else:
            self.old_pos_x = self.pos_x
            self.old_pos_y = self.pos_y
            self.old_pos_z = self.pos_z
            self.old_yaw = self.yaw
            self.old_pitch = self.pitch
            self.old_roll = self.roll
            self.pos_x = self.rigid_body_x
            self.pos_y = self.rigid_body_y
            self.pos_z = self.rigid_body_z
            self.yaw = self.rigid_body_yaw
            self.roll = self.rigid_body_roll
            self.pitch = self.rigid_body_pitch
