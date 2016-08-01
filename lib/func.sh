#!/bin/bash

# Author: Dinh Van Hung
# func.sh
#
# Description:
# Store all primary function for bb command
#

# Install all need packages
start(){
  # Update repositores
  sudo apt-get update
  # Instal git
  if hash git 2>/dev/null; then
    printf "Git has been installed!"
  else
    sudo apt-get install git && git config
  fi
  # Install Docker
  if has docker 2>/dev/null; then
    printf "Docker has been installed\n"
  else
    printf "=====================INSTALL DOCKER==============="
    wget -qO- https://get.docker.com/ | sh
  fi
  # Install Docker Compose
  # First, install python-pip as prerequisite:
  if docker-compose 2>/dev/null; then
    printf "Docker-compose has been installed\n"
  else
    printf "===================INSTALL DOCKER-COMPOSE==========="
    sudo apt-get -y install python-pip
    # After you can instal docker compose
    sudo pip install docker-compose
  fi





}
