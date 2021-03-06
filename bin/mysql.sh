#! /bin/bash

docker stop mysql-server
docker rm -f mysql-server
docker rmi -f mysql-server
docker build --no-cache -t mysql-server -f ./storage/Dockerfile-mysql ./storage
docker run -tid --name mysql-server -p 3306:3306 mysql-server
