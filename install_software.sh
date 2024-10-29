#!/bin/bash
# Install java
sudo apt update
sudo apt install openjdk-8-jdk -y
java -version
echo "export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")" | sudo tee -a /etc/profile
. /etc/profile

# Install maven
sudo apt install maven
mvn -version

# Install docker
# from https://docs.docker.com/engine/install/ubuntu/
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Use the command commented out below to test that docker is installed and working
#sudo docker run hello-world

# Install docker compose
# from https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

# Should be complete now. Note that you should use "docker compose" instead of "docker-compose" to run commands
