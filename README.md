# Hyunmin-Choi Documentations
***
## Documentation to set up ssh with worker node on Jenkins

### Prerequisites:

1. Create two instances one master node with jenkins installed and one worker node with tools needed installed
2. On worker add a user named jenkins with a password. ```useradd jenkins```
3. add jenkins user to the docker group to have permissions to use docker. ```usermod -aG docker jenkins```
       
 ### Create SSH connection:

- become jenkins user on master node ```su jenkins```
- ```ssh-keygen``` on master node as the jenkins user
- ```ssh-copy-id``` to worker node from master node
- Now on worker node add password to worker node jenkins user to ssh to with ```passwd jenkins``` command
- Edit /etc/ssh/sshd_config file on worker node
	- change PasswordAuthentication to yes
- restart sshd service in linux with ```systemctl restart sshd``` command 
 ### On Jenkins:

- In Jenkins credentials copy over rsa private key from master node  
- Go to manage nodes 
- create node name it and label it 
- select connect with ssh then pick ssh key that was added 

