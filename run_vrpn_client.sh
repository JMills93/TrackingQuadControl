#!/bin/bash
# author: Jay Mills, 19/2/2015
# runs the vrpn server client
#run by typing: ./run_vrpn.sh name
#repacing the name with the name of the tracked object

source devel/setup.bash

rosrun ros_vrpn_client ros_vrpn_client __name:=$1 _vrpn_server_ip:=10.0.0.10 _vrpn_port:=3883
