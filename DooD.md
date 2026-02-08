# Docker-out-of-Docker (DooD)

 Bir container içinden başka bir container’ı  kontrol edebilir ve başlatılabilir. Bu işleme genllikle "Docker-out-of-Docker" (DooD) denir.

Senin senaryonda docker-access içinden nginx container'ını başlatabilmen için, içteki container'ın Docker Daemon (ana makinedeki Docker motoru) ile konuşabiliyor olması gerekir.

İşte bu senaryoyu çözmek için izlemen gereken adımlar:

## 1. Temel Mantık: Docker Socket Paylaşımı
Docker, komutları bir "socket" dosyası üzerinden alır. Normalde bir container yalıtılmış bir ortamdır; ancak ana makinedeki
/var/run/docker.sock dosyasını hedef container'a bağlarsan (mount), o container ana makinedeki Docker motoruna emir verebilir hale gelir.

## 2. Çözüm Adımları
Eğer docker-access container'ı halihazırda çalışıyorsa ama Docker socket'ine erişimi yoksa, onu socket paylaşımı yapacak şekilde yeniden başlatman gerekir.
Container'ı Socket ile Yeniden Başlatın: Terminalde şu komutu kullanarak socket yetkisiyle ayağa kaldırın:

```
docker run -d --name docker-cli  -v /var/run/docker.sock:/var/run/docker.sock  docker:latest tail -f /dev/null
```

>NOT!
>Dikkat Edilmesi Gerekenler

>İzinler: Container içindeki kullanıcının /var/run/docker.sock dosyasına okuma/yazma yetkisi olmalıdır. Genellikle root kullanıcısı ile bu sorun aşılır.

>Güvenlik: Docker socket'ini bir container'a bağlamak, o container'a ana makinede tam yetki (root yetkisi gibi) vermek demektir. Üretim ortamlarında bu işlem çok dikkatli yapılmalıdır.

### Docker'ın Doğası: "Süreç Biterse Container Ölür"

Bir Docker container'ı, içinde çalışan ana süreç (PID 1) yaşadığı sürece çalışır. 
Eğer sadece docker run -d ... sh dersen, Docker bir terminal açar, içinde çalıştıracak komut bulamaz ve "işim bitti" diyerek shell'i kapatır.
Ana süreç (sh) kapandığı an, container da otomatik olarak Exited durumuna geçer.


###  tail -f /dev/null Ne Yapar?
Bu komutu ekleyerek container'ın ana sürecini değiştirmiş oluyorsun:

tail -f: Bir dosyanın sonuna eklenen verileri sonsuza kadar izle demektir.

/dev/null: İşletim sisteminde "kara delik" olarak bilinen boş bir dosyadır. Hiçbir zaman içine veri yazılmaz ve sonu gelmez.

Sonuç: Container, hiçbir zaman sonu gelmeyecek olan boş bir dosyayı izlemeye başlar. Bu sayede ana süreç asla bitmez, işlemciyi (CPU) yormaz ve container sen manuel olarak durdurana kadar arka planda "Up" (çalışıyor) durumunda kalır.



