FROM ubuntu:15.04
MAINTAINER Yonas Yanfa

WORKDIR /root
RUN apt-get update && apt-get install gcc libncurses-dev -y
ADD . /root
RUN cd /root/FreeBASIC-1.03.0-linux-x86_64 && ./install.sh -i && rm -rf /root/FreeBASIC-1.03.0-linux-x86_64
RUN /usr/local/bin/fbc /root/hello-world.bas
CMD bash -C '/root/run.sh';'bash'
