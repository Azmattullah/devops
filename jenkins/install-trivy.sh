#!/bin/sh

sudo apt update -y
sudo apt install wget apt-transport-https gnupg lsb-release -y

wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo gpg --dearmor \
  -o /usr/share/keyrings/trivy.gpg

echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] \
https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee \
/etc/apt/sources.list.d/trivy.list

sudo apt update -y
sudo apt install trivy -y

trivy --version
