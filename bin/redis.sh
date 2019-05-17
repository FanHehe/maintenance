#! /bin/bash

docker stop redis-server
docker rm -f redis-server
docker rmi -f redis-server
docker build --no-cache --rm -t redis-server -f ./storage/Dockerfile-redis ./storage
docker run -tid --privileged --name redis-server -v /sys/fs/cgroup:/sys/fs/cgroup:ro  -p 3306:3306 redis-server
