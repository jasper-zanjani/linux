# Install HashiCorp's GPG key
KEY=/usr/share/keyrings/hashicorp-archive-keyring.gpg
wget -O- https://apt.releases.hashicorp.com/gpg \
    | gpg --dearmor \
    | sudo tee $KEY > /dev/null

# Verify GPG key's fingerprint
gpg --no-default-keyring \
    --keyring $KEY \
    --fingerprint

# Add HashiCorp repos
echo "deb [arch=$(dpkg --print-architecture) signed-by=$KEY] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Install terraform
apt install -y terraform
