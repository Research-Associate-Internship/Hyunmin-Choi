#install Hashicorp Vault

#GPG is required for the package signing key
sudo apt update && sudo apt install gpg -y

#Download the signing key to a new keyring
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

#Verify the key's fingerprint
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

#Add the HashiCorp repo
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

#Update
sudo apt update

#install consul comes with vault
sudo apt install consul -y
