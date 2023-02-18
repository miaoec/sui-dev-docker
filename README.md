---
title: Install Sui With Docker
---



## Set up
Follow the steps below to build a Docker container that contains the sui development environment, provided that you need to install Docker and ssh

* build image
* start docker container
* connect docker container with ssh

### Install Docker(if need)
refer to [docker doc](https://docs.docker.com/engine/install/) to install

### Build Image
```shell
wget https://raw.githubusercontent.com/miaoec/sui-dev-docker/main/Dockerfile
docker build -f Dockerfile --build-arg  USER=${USER} PASSW={PASSW}  -t sui-dev:latest . 
#Example

#docker build -f Dockerfile  --build-arg  USER="root" PASSW="root"   -t sui-dev:latest . 
```

### Start Docker Container
```shell
docker run  -dit  -p 56000:22  --privileged sui-dev:latest
```

## Using the Sui-dev Container
### Connect Docker With SSH
```shell
ssh ${USER}@${HOST_IP} -p 56000
```

### Connect Container With Vscode
refer to [vscode doc](https://code.visualstudio.com) and vscode-extention [ms-vscode-remote.remote-ssh doc](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)  to install
