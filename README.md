# d0cker
Docker Çalışma Notlarım (TR)


# Docker Kılavuzu

Docker, konteynerleştirme teknolojisini kullanarak uygulamaların ve onların bağımlılıklarının taşınabilir, izole edilmiş ortamlar içinde çalıştırılmasını sağlar. Geliştiricilerin uygulamalarını bir "konteyner" içinde paketlemelerine ve bu konteynerleri herhangi bir ortamda çalıştırmalarına olanak tanır. Bu sayede, "çalışıyor ama benim bilgisayarımda" sorunu ortadan kalkar.

## İçindekiler

- [Konteyner Yönetimi](#konteyner-yönetimi)
- [Docker Volume](#docker-volume)
- [Docker Network](#docker-network)
- [Log Yönetimi](#log-yönetimi)
- [Sistem Kaynakları Yönetimi](#sistem-kaynakları-yönetimi)
- [Environment Variables](#environment-variables)
- [Dockerfile Kullanımı](#dockerfile-kullanımı)
- [Image Yönetimi](#image-yönetimi)
- [Port Yayını](#port-yayını)
- [Dosya Kopyalama](#dosya-kopyalama)
- [Konteynerden Image Oluşturma](#konteynerden-image-oluşturma)
- [Image Yedekleme ve Geri Yükleme](#image-yedekleme-ve-geri-yükleme)
- [Docker Registry](#docker-registry)
- [Temizlik Komutları](#temizlik-komutları)

---

## Konteyner Yönetimi

Docker ile konteyner oluşturmak ve yönetmek oldukça kolaydır. İşte bazı temel komutlar:

- **Konteyner Oluşturma ve Çalıştırma:**
  ```bash
  docker container run -d --name test httpd
