#!bin/bash

#install java
sudo apt install openjdk-11-jdk -y

#add repository key to system 
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg

#append repo to sources.list
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

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
