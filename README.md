# docker のrosを引っ張ってくる
docker pull ros:kinetic

# tagをつける
docker build --tag ros:ros-turtlebot3 .


# 中に入りたい時
docker run -i -t コンテナ名
# ビルド途中で死んだ時
http://blog.namiking.net/post/2015/09/docker-exec-exited/

基本bin/shのためsourceは使えない やりたければこちら https://qiita.com/lilacs/items/4d4e3f169a04560dee76


# カメラ使う時
--device=/dev/video0:/dev/video0
をオプションでつける



# docker networkを作成
docker network create rosnet

# master起動
docker run -it --rm --net rosnet --name master ros:ros-turtlebot3 roscore


# roslanuch
docker run -it --rm --net rosnet --name talker --env ROS_HOSTNAME=remote --env ROS_MASTER_URI=http://master:11311 ros:ros-turtlebot3 roslaunch turtlebot3_bringup turtlebot3_remote.launch

# roslanuch
docker run -it --rm --net rosnet --name talker --env ROS_HOSTNAME=robot --env ROS_MASTER_URI=http://master:11311 ros:ros-turtlebot3 roslaunch turtlebot3_bringup turtlebot3_robot.launch 
