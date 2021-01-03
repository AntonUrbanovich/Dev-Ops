1.8 
Создание Dockerfile:
    - docker build -t urbanovich/apache2 .
Запуск контейнера urbanovich/apache2:
    - docker run  -p 8081:80 --name apache2 -h impalla215 urbanovich/apache2
Создание папок:
    - mkdir web, cd web, mkdir etc, mkdir www




1.9 

Установка docker-compose на хост и создание в корневой папке проекта файла docker-compose.yml
В файле указано 3 контейнера, nginx, apacke2, mysql.
Запуск docker-compose.yml:
    - docker-compose up
Для nginx пробрасываем порты 80:8080. Запросы буду перенаправлены на страницу apache2:


Для проверки соединения, нужно подсоедениться к рабочему контенеру:
    - docker-compose exec web /bin/bash



1.10

Для наглядного изучения команда Kubernetes использовал:
    https://kubernetes.io/ru/docs/reference/kubectl/cheatsheet/

Запуск локального кластера Kubernetes:
    - minikube start --vm-driver=docker
Создание пространства имен:
    - kubectl create namespace test
Сохранение пространства имен для свех последующих команд kubectl в этом контексте:
    - kubectl config set-context --current --namespace=test
Запуск deployment:
    - kubectl apply -f ant-deployment.yml
Нас интересует тип NodePort, так как к нему можно подключаться из вне.
    - kubectl expose ant-deployment --type=NodePort --port=8000
Обращение к приложению:
    minicube service ant-deployment -n testcluster
Загрузка конфига в кластер:
    - kubectl apply -f ingress-nginx.yaml
Используемая литература:
    https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource - установка Ingress rule.
    https://serveradmin.ru/nastroyka-kubernetes/#_Ingress - настройка и загрузка конфига в кластер кубернетиса.


kubectl cluster-info
