# Fire-fighting-drone
This is a simple simulation of a custom made drone experiencing external force, controllable by a GUI interface, in order to demonstrate its robust stability.
It has been successfully built and tested on an Ubuntu 20.04 system using ROS Noetic and Ardupilot open source flight controller, on a gazebo-classic simulator.

Steps to implement it:
  1) Create a folder in your home directory.
  2) Clone this repository in the folder.
  3) Clone the ardupilot using "git clone --recurse-submodules https://github.com/Ardupilot/ardupilot" in the same folder.
  4) pull the docker image using "docker pull magnoshipyard/quad-dev:eigenform"
  5) start the container using "./drone.sh"
  6) edit the bashrc file to set the WS_PATH variable to the file path of your folder.
  7) cd into the workspace and build it using "catkin build"
  8) Enter the commands in different tilix windows in the follow order:
     startSITL
     startGZ
     startAPM
     rosrun drone_package main.py
