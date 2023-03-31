# Hyunmin-Choi Documentations
***
## Documentation to set up ssh with worker node on Jenkins
***
### Prerequisites:
***
1. On worker add a user named Jenkins with a password.
2. add Jenkins user to the docker group to have permissions to use docker.
       
 ### On CLI or terminal:
 ***
- ssh-keygen on master node as the Jenkins user
  ```su Jenkins```
- ```ssh-copy-id``` to worker node from master node
- add password to user to ssh to with passwd user command
- Edit /etc/ssh/sshd_config file on worker node
	- change PasswordAuthentication to yes
- restart sshd service in linux
 ### On Jenkins:
 ***
- In Jenkins credentials copy over rsa private key from master node  
- Go to manage nodes 
- create node name it and label it 
- select connect with ssh then pick ssh key that was added 

