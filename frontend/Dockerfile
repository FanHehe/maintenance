FROM node-base:latest
MAINTAINER fanhehe "vcrmp3@gmail.com"
RUN mkdir /www && cd /www
WORKDIR /www
RUN git clone https://github.com/FanHehe/fanhehe.frontend.git  && cd ./fanhehe.frontend
WORKDIR /www/fanhehe.frontend
RUN git fetch
RUN git checkout origin/master
RUN git submodule update --init
RUN cnpm install
#RUN npm run build
ENTRYPOINT ["npm", "run", "dev"]
EXPOSE 3000
