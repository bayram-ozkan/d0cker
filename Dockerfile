# Oluşturulan imajın hangi imajda çalışacağı belirtiliyor.
FROM ubuntu:18.04

# Güncelleme yapıyor
RUN apt-get update -y

# Gerekli uygulamaları kuruyor
RUN apt-get install default-jre -y 

# Dizin değiştiriyor. Uygulamanın çalışağı dizini oluşturuyor
WORKDIR /merhaba

# Uygulamanın nerden kopyalanaçağı ve nerede çalışacağını belirtiriyoruz. 
# Uygulama /myapp klasöründen kopyalanacak ve  /merhaba klasöründe çalışacak
# WORKDIR le dizin değiştirdiğimiz için destinatin kısmında bulunduğun dizin anlamına gelen "." ile belirtiyoruz.
# COPY source destination
COPY /myapp .

CMD [ "java","merhaba" ]





