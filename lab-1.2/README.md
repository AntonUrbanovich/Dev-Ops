# Работа с docker:  
Установливаем docker  
Скачиваем образ nginx и проверяем наличие образа:  

- docker pull nginx:latest  

![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/docker.jpg)


Создаем папку nginx и в ней etc:  

- mkdir nginx  
- cd nginx  
- mkdir etc  


Запускаем контейнер подмонтировав созданную папку etc в etc/nginx и пробрасываем порты 80 из контейнера на хост в порт 8080  

- docker run -it -p 8080:80 -v $pwd/nginx/etc:etc/nginx nginx /bin/bash  

Проверяем результат в браузере, зайдя на http://localhost:8080/  



![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/docker2.jpg)  


# Dockerfile:  

Создаем файл Dokcerfile в корне проекта.В этом файле из образа ubuntu:bionic создаём контейнер в котором требуется, обновить все пакеты системы, установить apache2, ntp, jdk и назначить WORKDIR на /var/www/sit.  

Делаем build Dockerfile:  

- docker build -t urbanobivich/apache2   

![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/dockerfile1.jpg)


Создаем папки:  

- mkdir web  
- cd web  
- mkdir etc  
- mkdir www  


Запускаем docker container:  

- docker run -it -p 8081:80 urbanovich/apache2 bash  

![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/dockerfile2.jpg)
  

Остановим docker container:  

- docker stop [container id]  

Делаем push полученного образа в dockerhub:  













# Dockercompose:  

Cоздаём в корневой папке проекта файл docker-compose.yml. В файле указанно 3 контейнера, 2 из них были сделанны раннее, 1 новый с mysql. Установленя свзять между ngnix and apache apache and database  

Запускаем docker-compose:  

- docker-compose up  

При открытии страницы в браузерe http://localhost:80/ видим дефолктную страницу apache:  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/docker-compose1.jpg)



