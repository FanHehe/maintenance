#! /bin/bash

docker stop frontend
docker rm -f frontend
docker rmi -f frontend
docker build -t frontend ./frontend
docker run -tid --name frontend -p 3000:3000 frontend
