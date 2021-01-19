# Работа с docker:  
Устанавливаем docker  
Скачиваем образ nginx и проверяем наличие образа:  

- docker pull nginx:latest  

![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/docker.jpg)


Создаем папку nginx и в ней etc:  
- `mkdir nginx`  
- `cd nginx`  
- `mkdir etc`  
  

Запускаем контейнер подмонтировав созданную папку etc в etc/nginx и пробрасываем порты 80 из контейнера на хост в порт 8080  

- `docker run -it -p 8080:80 -v $pwd/nginx/etc:etc/nginx nginx /bin/bash` 

Проверяем результат в браузере, зайдя на http://localhost:8080/  



![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/docker2.jpg)  


# Dockerfile:  

Создаем файл Dokcerfile в корне проекта.В этом файле из образа ubuntu:bionic создаём контейнер в котором требуется, обновить все пакеты системы, установить apache2, ntp, jdk и назначить WORKDIR на /var/www/sit.  

Делаем build Dockerfile:  

- `docker build -t urbanobivich/apache2`   

![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/dockerfile1.jpg)


Создаем папки:  
- `mkdir web`  
- `cd web`  
- `mkdir etc`  
- `mkdir www`  

Запускаем docker container:  

- `docker run -it -p 8081:80 urbanovich/apache2 bash`  

![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/dockerfile2.jpg)
  

Остановим docker container:  

- `docker stop [container id]`  

Делаем push полученного образа в dockerhub:  













# Dockercompose:  

Cоздаём в корневой папке проекта файл docker-compose.yml. В файле указано 3 контейнера, 2 из них были сделаны ранее, 1 новый с mysql. Установлена связь между ngnix and apache, apache and database  

Запускаем docker-compose:  

- `docker-compose up`  

При открытии страницы в браузерe http://localhost:80/ видим дефолтную страницу apache:  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/docker-compose1.jpg)  


Для наглядного изучения проксирования на nginx использовал:  
https://www.8host.com/blog/shifrovanie-soedinenij-tomcat-8-na-apache-ili-nginx-v-ubuntu-16-04/  

Для проверки соединения apache and database можно присоединиться к контейнеру:  

- docker-compose exec web /bin/bash  

Для соединения с базой через link, который указан в configs/my.cnf(порт 3306), используем telnet:  

- `apt install telnet`  

- `telnet database 3306:`  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/docker-compose3.jpg)


В дополнение к ним создали ещё 1 контейнер с tomcat-сервером на порту 8080 и выполнили настройку в балансировщике при обращении http://localhost:tomcat-server/  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/docker-compose2.jpg)  



# Работа с kubernetes:  




Для наглядного изучения команда Kubernetes использовал:  
https://kubernetes.io/ru/docs/reference/kubectl/cheatsheet/  



Запуcкаем локальный кластер Kubernetes:  
- `minikube start --vm-driver=docker`
Создаём пространство имён:  
- `kubectl create namespace test`  
Сохраняем пространства имен для всех следующих команда kubectl в этом контексте:  
- `kubectl config set-context --current --namespace=test`  
Запускаем deployment:  
- `kubectl apply -f ant-deployment.yml`  
Нас интересует тип NodePort, так как к нему можно подключаться из вне.  
- `kubectl expose ant-deployment --type=NodePort --port=8000`  
Обращение к приложению:  
- `minicube service ant-deployment -n test`  
Загрузка конфига в кластер:  
- kubectl apply -f ingress-nginx.yaml  Используемая литература:  
- https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource - установка Ingress rule.
- https://serveradmin.ru/nastroyka-kubernetes/#_Ingress - настройка и загрузка конфига в кластер кубернетиса.





