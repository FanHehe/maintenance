FROM node-base:latest
MAINTAINER fanhehe "vcrmp3@gmail.com"
RUN mkdir /www && cd /www
WORKDIR /www
RUN git clone https://github.com/FanHehe/fanhehe.backend.git && cd ./fanhehe.backend
WORKDIR /www/fanhehe.backend
RUN git fetch
RUN git checkout origin/master
RUN cnpm install
RUN pwd
RUN npm run dist
ENTRYPOINT ["npm", "run", "deploy"]
EXPOSE 5000
