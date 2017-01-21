#! /bin/bash

docker stop backend
docker rm -f backend
docker rmi -f backend
docker build --no-cache -t backend ./backend
docker run -tid --name backend -p 5000:5000 backend
