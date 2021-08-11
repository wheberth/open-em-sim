FROM ubuntu:focal

# Localization
ARG TZ=Europe/Berlin
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime
ENV LANGUAGE en_US.UTF-8

# Prepartation
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common apt-utils apt-transport-https ca-certificates curl gnupg lsb-release locales

# ElmerFEM with GUI and CAD/Mesh tools
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:elmer-csc-ubuntu/elmer-csc-ppa
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y elmerfem-csc-eg netgen python3-netgen paraview freecad

RUN mkdir -p /home/work
WORKDIR /home/work