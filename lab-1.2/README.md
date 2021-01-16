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



