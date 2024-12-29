#!/bin/bash

# Docker Kurulum Scripti
set -e

# Sistem paketlerini güncelle
echo "Sistem güncelleniyor..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Gerekli paketleri yükle
echo "Gerekli paketler yükleniyor..."
sudo apt-get install -y ca-certificates curl lsb-release

# Docker'ın GPG anahtarını ekle
echo "Docker GPG anahtarı ekleniyor..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Docker repo'sunu ekle
echo "Docker repository'si ekleniyor..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Paket listelerini tekrar güncelle
echo "Paket listeleri güncelleniyor..."
sudo apt-get update -y

# Docker ve bağlı bileşenlerini yükle
echo "Docker yükleniyor..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Kullanıcıyı Docker grubuna ekle
echo "Kullanıcı Docker grubuna ekleniyor..."
sudo usermod -aG docker $USER

# Docker'ı çalıştırmayı test et
echo "Docker servisinin başlatılması..."
sudo systemctl enable --now docker

# Docker kurulumunu doğrula
echo "Docker kurulumu doğrulanıyor..."
sudo docker --version

# Kullanıcıya Docker'ı kullanabilmesi için çıkış yapması gerektiğini bildir
echo "Docker kurulumu tamamlandı. Şimdi, Docker'ı kullanabilmek için çıkış yapıp tekrar oturum açmanız veya terminali yeniden başlatmanız gerekiyor."

# Alternatif olarak, aşağıdaki komutla çıkışı otomatikleştirebilirsiniz:
# exit
