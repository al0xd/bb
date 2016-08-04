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
    printf "Git has been installed!\n"
  else
    sudo apt-get install git
  fi
  # Install Docker
  if hash docker 2>/dev/null; then
    printf "Docker has been installed\n"
  else
    printf "\n=====================INSTALL DOCKER===============\n"
    wget -qO- https://get.docker.com/ | sh
  fi
  # Install Docker Compose
  # First, install python-pip as prerequisite:
  if hash docker-compose 2>/dev/null; then
    printf "Docker-compose has been installed\n"
  else
    printf "\n===================INSTALL DOCKER-COMPOSE===========\n"
    sudo apt-get -y install python-pip
    # After you can instal docker compose
    sudo pip install docker-compose
  fi
  # Install Pbclip
  if hash xclip 2>/dev/null; then
    printf "\nXclip has been installed!\n"
  else
    sudo apt-get install -y xclip
  fi




}
