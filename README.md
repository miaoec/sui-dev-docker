---
title: Install Sui With Docker
---


## Set up
# 根据以下步骤构建包含sui开发环境的Docker容器，前提是需要安装docker以及ssh

* build image
* start docker container
* connect docker container with ssh

## Build Image
```
wget https://raw.githubusercontent.com/miaoec/sui-dev-docker/main/Dockerfile
docker build -f Dockerfile -t sui-dev:latest . 
```

## Start Docker Container
```
docker run  -dit  -p ${PORT}:22 --build-arg  USER=${USER} PASSW={PASSW}  --privileged sui-dev:latest
# Example 
docker run  -dit  -p 56000:22 --build-arg  USER="root" PASSW="root" --privileged sui-dev:latest  

```

## Connect Docker With SSH
```
ssh root@${USER} -p ${PASSW}
```

## Connect Container With Vscode
install vscode and vscode-extention ms-vscode-remote.remote-ssh

## Install Docker(if need)
https://docs.docker.com/engine/install/


```


```
