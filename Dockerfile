FROM ubuntu:20.04

LABEL MAINTAINER="poemiao.eth@gmail.com"

ARG TZ=Asia/Shanghai
ARG USER=root
ARG PASSW=root

## avoid cmake interactive
ENV DEBIAN_FRONTEND=noninteractive

## install package
RUN apt-get update&&\
    apt install -y  curl openssh-server git-all cmake gcc libssl-dev pkg-config libclang-dev build-essential

## set sshd&user
RUN sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    sed -i "s/#AllowTcpForwarding.*/AllowTcpForwarding yes/g" /etc/ssh/sshd_config &&\
    mkdir -p /root/.ssh && chmod 700 /root/.ssh/ && \
    ssh-keygen -A && \
    echo ${USER}":"${PASSW} | chpasswd &&\
    mkdir /var/run/sshd

## install rust&move
ENV PATH="/root/.cargo/bin:$PATH"
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable&&rustup update stable
RUN cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
RUN cargo install --git https://github.com/move-language/move move-analyzer --features "address20"

EXPOSE 22 
CMD  ["/usr/sbin/sshd","-D"]
