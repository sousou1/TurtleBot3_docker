FROM ros:kinetic
# install ros tutorials packages
RUN apt-get update && apt-get install -y
RUN apt-get install -y ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers ros-kinetic-robot-state-publisher ros-kinetic-tf ros-kinetic-rosserial-python net-tools python-rosinstall sudo udev


WORKDIR /root/catkin_ws/src/
RUN git clone https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
WORKDIR /root/catkin_ws/
RUN echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
RUN . /opt/ros/kinetic/setup.sh && catkin_make
RUN . ~/catkin_ws/devel/setup.sh && rosrun turtlebot3_bringup create_udev_rules
