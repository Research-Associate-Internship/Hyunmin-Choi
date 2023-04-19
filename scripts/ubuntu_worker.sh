#!/bin/bash

#Install java, epel and utilities
sudo apt install openjdk-11-jdk -y

#Install git
sudo apt install -y git

#update apt package and install packages to allow apt to use a repository over HTTPS
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#add Docker's official GPG key    
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#set up repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#update and install docker
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#start and enable service
sudo systemctl start docker
sudo systemctl enable docker

#Install terraform
#install GPG key
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

#verify keys fingerprint
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

#setup Hashicorp repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

#install terraform
sudo apt update
sudo apt-get install terraform -y

#disable ufw
sudo ufw disable
sudo systemctl stop ufw

#kubectl 
#updates packages and install packages needed to use the Kubernetes apt repository
sudo apt-get update  
sudo apt-get install -y ca-certificates curl

#If you use Debian 9 (stretch) or earlier you would also need to install apt-transport-https:
sudo apt-get install -y apt-transport-https

#download google cloud public signing key
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

#Add the Kubernetes apt repository
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

#update apt packages with new reposiory and install kubectl
sudo apt-get update
sudo apt-get install -y kubectl
