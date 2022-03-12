#docker build -t ethereum-audit-toolbox-img . 
#Using the Ubuntu image (our OS)
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive 

ARG NODE_VERSION=14.16.0
ARG NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ARG NODE_HOME=/opt/$NODE_PACKAGE

ENV NODE_PATH $NODE_HOME/lib/node_modules
ENV PATH $NODE_HOME/bin:$PATH

# Install node
RUN apt-get update && apt-get install -y \
  ca-certificates \
  curl
RUN curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /opt/

# Update package manager (apt-get) 
# and install (with the yes flag `-y`)
# Python and Pip
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip

# Install manticore
RUN pip install manticore

# Install octopus
RUN pip install octopus

# Install slither
RUN pip install slither-analyzer

#RUN npm install hardhat -y
RUN npm install ganache --global -y

# Install oyente
#RUN pip install oyente