#!/bin/bash

# Author: Dinh Van Hung
# func.sh
#
# Description:
# Store all primary function for bb command
#

# Install all need packages
start(){
  local MSG_INSTALLED="has been installed!"
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
    printf "Docker $MSG_INSTALLED \n"
  else
    printf "\n=====================INSTALL DOCKER===============\n"
    wget -qO- https://get.docker.com/ | sh
  fi
  # Install Docker Compose
  # First, install python-pip as prerequisite:
  if hash docker-compose 2>/dev/null; then
    printf "Docker-compose $MSG_INSTALLED \n"
  else
    printf "\n===================INSTALL DOCKER-COMPOSE===========\n"
    sudo apt-get -y install python-pip
    # After you can instal docker compose
    sudo pip install docker-compose
  fi

  # Install Docker Machine
  curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine

  # Install Rbenv
  if hash rbenv 2>/dev/null; then
    printf "\n Rbenv $MSG_INSTALLED \n"
  else
    sudo apt-get update && sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev && \
      cd && \
      git clone git://github.com/sstephenson/rbenv.git .rbenv && \
      echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile && \
      echo 'eval "$(rbenv init -)"' >> ~/.bash_profile && \
      git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
      echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile && \
      source ~/.bash_profile
  fi

  # Install ruby 

  if hash ruby 2>/dev/null; then
    printf "\bRuby $MSG_INSTALLED"
  else
    rbenv install -v 2.2.3 && \
      rbenv global 2.2.3 && \
      rbenv local 2.2.3 && \
      echo "gem: --no-document" > ~/.gemrc # It is likely that you will not want Rubygems to generate local documentation for each gem that you install, as this process can be lengthy 
  fi
  # Install Mkdocs
  if hash mkdocs 2>/dev/null; then
    printf "\nMkdocs $MSG_INSTALLED \n"
  else
    pip install mkdocs
  fi

}
