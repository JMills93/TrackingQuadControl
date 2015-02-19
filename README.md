#author: Jay Mills 19/02/2015
This is the first version of the quadcopter controller running off vicon measurments
The altitude controller is experimental at the moment, and does not currently have 
an attitude controller


Installing:
-Download install.sh and place in directory you want to download the software to
-In a terminal go to directory install.sh is and run: ./install.sh
-The install process will take a few minutes depending on the internet connection
-The install process has been tested on ubuntu 14.04 but should work with 13.10
-Other versions of ubuntu require different versions of ROS to run


Running this program:
-connect an ethernet cable to the computer running ros, make sure your ethernet
 IPv4 settings are as followed: Address = 10.0.0.20, Netmask = 255.0.0.0, Gateway = 10.0.0.10
-Run commands in seperate terminals:
-> roscore
-> ./run_vrpn.sh name (for all required tracked objects)
	(where name is replaced with name of object being tracked)
-> python quad_controller.py

-after running ./run_vrpn_client.sh, in a new terminal run: rostopic echo /name/pose
 this should have a stream of data if connected properly, (name being replaced with 
 name of object


Problems with running:
-most known problems can be fixed by running:
->./clean_build.sh


Making changes to the Python control program(quad_control.py):
-to input your own control algorithm, place functions into ControlSystem.control_loop() function
 after self.calc_error() call. (around line 135)
-Adjust the self.calc_error() call to product the correct error formulations as required


Adding in extra tracked rigid body objects: 
-define as rigid body in the main function (see rigid_body.py) as same name as in tracking software 
 (around line 689)
-call update position values inside the ControlSystem.control_loop() function. (around line 130)


Making changes to the UI:
-edit ControlPannel.ui in Qt
-run the below command to compile the ui into a python runnable file
-> ./convert_ui.py ControlPannel ControlPannel
-adjust accordingly in UI_ControlPannel class in quadcopter_control.py
-UI_ControlPannel.setup(), initialises all callbacks 
-UI_ControlPannel.update(), loops to update output values to the ui

