#!/bin/bash

apt-get update
apt-get -y install wget
wget -qO- https://get.docker.com/ | sh
gpasswd -a vagrant docker
sudo apt-get -y install python-pip
sudo pip install -U docker-compose
sudo usermod -aG docker ubuntu
service docker restart
docker-compose --version
