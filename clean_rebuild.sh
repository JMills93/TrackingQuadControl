#!/bin/bash
#author: Jay Mills 19/02/2015
#if problems persist rebuild the programs workspace

sudo rm -rf build
sudo rm -rf devel
source /opt/ros/indigo/setup.bash
catkin_make
source /devel/setup.bash
