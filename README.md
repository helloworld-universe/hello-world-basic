# Hello World in BASIC

## Install
- Install Docker
```
apt-get install docker
```
- Download this repository
```
wget https://github.com/helloworld-universe/hello-world-basic/archive/master.zip
unzip master.zip
cd hello-world-basic-master
```
- Build the docker image
```
docker build -t hello-world/basic .
```
- Run the docker container
```
docker run --rm -it hello-world/basic
```
