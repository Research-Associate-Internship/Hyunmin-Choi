#!bin/bash

#install java
sudo apt install openjdk-11-jdk -y

#add repository key to system 
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

#append repo to sources.list
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

#update
sudo apt update -y 

#install jenkins
sudo apt install jenkins -y

#start jenkins service and enable
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service

#open port 8080 for jenkins
# sudo ufw allow 8080
# sudo ufw enable

#disable ufw
sudo ufw disable
sudo systemctl stop ufw
