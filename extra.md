# Docker extra bilgiler

## CLI da login olduğumuz hesap bilgilieri

### Giriş bilgileri config 
```
cat ~/.docker/config.json 
```
  * Decode  --> Çıktı: kullaniciadi:şifre
  ```
cat ~/.docker/config.json | jq -r '.auths["https://index.docker.io/v1/"].auth' | base64 --decode

  ```
