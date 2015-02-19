#!/bin/bash
#author: Jay Mills 19/02/2015
#converts a QT user interface into a runnable python script
#run as: 
#./convert_ui name_in name_out
pyuic4 -x $1.ui -o $2.py
