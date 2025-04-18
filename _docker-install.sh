#!/bin/bash

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Kullanıcıyı Docker grubuna ekle
echo "Kullanıcı Docker grubuna ekleniyor..."
sudo usermod -aG docker $USER
#newgrp docker


# Docker'ı çalıştırmayı test et
echo "Docker servisinin başlatılması..."
sudo systemctl enable --now docker

# Docker kurulumunu doğrula
echo "Docker kurulumu doğrulanıyor..."
sudo docker --version

