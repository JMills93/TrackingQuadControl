__author__ = 'Jay Mills'

#this program defines an altitude controller class

import math
import time


# experimental altitude controller, all positions are in cm
class AltControl:

    dt = 0.01

    alt_limited = False
    alt_max = 200
    speed_up_max = 10
    speed_down_max = -10

    velocity_limited = False

    curr_pos_z = 0.0
    curr_vel_z = 0.0
    curr_accel_z = 0.0

    old_pos_z = 0.0
    old_vel_z = 0.0
    
    pos_target_z = 0.0
    vel_target_z = 0.0
    accel_target_z = 0.0

    vel_last_z = 0.0

    #PID constants and variabes for altitude
    pos_p_z = 1.0
    vel_p_z = 6.0
    accel_p_z = 0.75
    accel_i_z = 1.5
    accel_d_z = 0.0
    accel_integral_z = 0.0
    accel_integral_max_z = 100
    old_accel_diff_z = 0.0
    curr_accel_diff_z = 0.0

    #debugging variables
    p_effort_z = 0.0
    i_effort_z = 000.000
    d_effort_z = 000.000
    desired_accel_z = 0.0

    
    #time constants for altitude (0.5 is equivalent to 2Hz cutoff frequency)
    vel_Tf_z = 0.5
    vel_estim_Tf_z = 0.5
    accel_Tf_z = 0.5
    accel_estim_Tf_z = 0.5
    accel_diff_Tf_z = 0.5

    #filtered values for altitude
    vel_filter_z = 0.0
    vel_estim_filter_z = 0.0
    accel_filter_z = 0.0
    accel_estim_filter_z = 0.0
    accel_diff_filter_z = 0.0

    throttle_setting = 0.0
    hover_throttle = 0.0

    first_time = True
    debug_count = 0

    #initialiser
    def __init__(self, dt):
        self.dt = dt

    # update the current altitude
    def update_altitude(self, altitude):
        self.curr_pos_z = altitude

    # updates the current altitude target
    def update_altitue_target(self, target):
        self.pos_target_z = target

    def update_old_altitude(self, old_altitude):
        self.old_pos_z = old_altitude
        

    # calculates the control effor require for altitude control
    def update_z_controller(self, altitude, old_altitude, altitude_target):

        # update the current altitude and target
        self.update_altitude(altitude)
        self.update_old_altitude(old_altitude)
        self.update_altitue_target(altitude_target)

        if self.first_time:
            #works out the first velocity from backwards difference
            self.curr_vel_z = (self.curr_pos_z - self.old_pos_z) / self.dt
            self.first_time = False
        else:
            #working out the current velocity
            self.curr_vel_z = self.vel_estimator_filter_z(self.curr_pos_z - self.old_pos_z)

        #working out the current acceleration
        self.curr_accel_z = self.accel_estimator_filter_z(self.curr_vel_z - self.old_vel_z)

        #calculates the velocity target and continues the control algorithm
        self.pos_to_rate_z()

        if self.debug_count == 20:
            #print self.curr_accel_z
            #print self.throttle_setting, self.p_effort_z, self.i_effort_z, self.hover_throttle
            #print self.curr_accel_z, self.accel_target_z, self.vel_target_z, self.curr_pos_z, self.pos_target_z, \
            #   self.curr_vel_z, self.vel_target_z, self.throttle_setting, self.p_effort_z, self.i_effort_z, self.d_effort_z
            self.debug_count =0
        else:
            self.debug_count += 1
        
        #update old position and velocity for next iteration
        self.old_vel_z = self.curr_vel_z
        return self.throttle_setting

    def pos_to_rate_z(self):

        #check if position exceeds the set limits
        self.alt_limited = False
        if self.pos_target_z > self.alt_max:
            self.pos_target_z = self.alt_max
            self.alt_limited = True

        #calculates position error
        pos_error_z = self.pos_target_z - self.curr_pos_z

        #calculates the velocity target via a square root controller
        self.vel_target_z = sqrt_controller(pos_error_z, self.pos_p_z, self.curr_accel_z)
        #calculates the acceleration target
        self.rate_to_accel_z()

    #calculates the acceleration target from the velocity error
    def rate_to_accel_z(self):
        
        #check if the target velocity exceeds the set limits
        self.velocity_limited = False
        if self.vel_target_z > self.speed_up_max:
            self.vel_target_z = self.speed_up_max
            self.velocity_limited = True
        elif self.vel_target_z < self.speed_down_max:
            self.vel_target_z = self.speed_down_max

        if self.dt > 0.0:
            accel_feed_forward = (self.vel_target_z - self.vel_last_z)/self.dt
        else:
            accel_feed_forward = 0

        self.vel_last_z = self.vel_target_z

        vel_error_z = self.vel_error_filter_z(self.vel_target_z - self.curr_vel_z)

        p_effort = self.vel_p_z * vel_error_z

        self.desired_accel_z = accel_feed_forward + p_effort

        self.accel_to_throttle_z(self.desired_accel_z)

    def accel_to_throttle_z(self, desired_accel):

        self.accel_target_z = desired_accel

        accel_error_z = self.accel_error_filter_z(self.accel_target_z - self.curr_accel_z)

        p_effort = self.accel_p_control_z(accel_error_z)
        i_effort = self.accel_i_control_z(accel_error_z, self.accel_integral_max_z)
        d_effort = self.accel_d_control_z(accel_error_z)

        self.p_effort_z = p_effort
        self.i_effort_z = i_effort
        self.d_effort_z = d_effort


        #_attitude_control.set_throttle_out((int16_t)p+i+d+_throttle_hover, true); #in the range of 0-1000
        self.throttle_setting = p_effort + i_effort + d_effort + self.hover_throttle



    def reset_controller_z(self):
        self.accel_integral_z = 0.0
        print"reset"

    #below are different filters used by the control algorithm
    def vel_error_filter_z(self, error):
        #working out the filtering constant
        alpha = (self.vel_Tf_z / (self.vel_Tf_z + self.dt))
        self.vel_filter_z = discrete_filter(error, self.vel_filter_z, alpha)
        return self.vel_filter_z

    def vel_estimator_filter_z(self, error):
        alpha = (self.vel_estim_Tf_z / (self.vel_estim_Tf_z + self.dt))
        self.vel_estim_filter_z = discrete_filter(error / self.dt, self.vel_estim_filter_z, alpha)
        return self.vel_estim_filter_z

    def accel_error_filter_z(self, error):
        alpha = (self.accel_Tf_z / (self.accel_Tf_z + self.dt))
        self.accel_filter_z = discrete_filter(error, self.accel_filter_z, alpha)
        return self.accel_filter_z

    def accel_estimator_filter_z(self, error):
        alpha = (self.accel_estim_Tf_z / (self.accel_estim_Tf_z + self.dt))
        self.accel_estim_filter_z = discrete_filter(error / self.dt, self.accel_estim_filter_z, alpha)
        return self.accel_estim_filter_z

    def accel_differential_filter_z(self, error):
        alpha = (self.accel_diff_Tf_z / (self.accel_diff_Tf_z + self.dt))
        self.accel_diff_filter_z = discrete_filter(error / self.dt, self.accel_diff_filter_z, alpha)
        return self.accel_diff_filter_z

    def accel_d_control_z(self, accel_error):
        self.old_accel_diff_z = self.curr_accel_diff_z
        self.curr_accel_diff_z = self.accel_differential_filter_z(accel_error)
        return self.curr_accel_diff_z * self.accel_d_z

    def accel_p_control_z(self, accel_error):
        return p_controller(accel_error, self.accel_p_z)

    def accel_i_control_z(self, accel_error, integral_max):
        self.accel_integral_z = i_controller(accel_error * self.dt, self.accel_i_z, self.accel_integral_z)
        if self.accel_integral_z > integral_max:
            self.accel_integral_z = integral_max
        elif self.accel_integral_z < -integral_max:
            self.accel_integral_z = -integral_max
        return self.accel_integral_z

def discrete_filter(xin, filter_out_old, alpha):
    return (alpha * filter_out_old) + ((1-alpha) * xin)


def p_controller(error, p):
    return error * p


def i_controller(error, i, curr_integral):
    return curr_integral + (error * i)

#same square root controller used in qrdupilot
def sqrt_controller(error, p, second_order_limit):

    global i
    #checks if any of the input variables are zero and returns a zero
    if (second_order_limit == 0.0) or (p == 0.0):
        return error * p
    #calculates the linear distance
    linear_distance = second_order_limit/(p*p)
    if linear_distance < 0:
        linear_distance = -linear_distance
    #checks if the error is outside of the linear distance and performs
    #the square root control algorithm
    if error > linear_distance:
        tmp = 2.0*second_order_limit*(error-(linear_distance/2))
        if tmp < 0:
            tmp = -tmp
        return math.sqrt(tmp)
    elif error < -linear_distance:
        tmp = 2.0*second_order_limit*(-error-(linear_distance/2))
        if tmp < 0:
            tmp = -tmp
        return -math.sqrt(tmp)
    #else returns a linear control response
    else:
        return error*p
