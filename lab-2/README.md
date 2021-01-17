# Работа с Jenkins:  

Устанавливаем Jenkins server на локальный компьютер. 

Создаем новый проект Staging и добавляем задачу для сборки простого java web-application.  

Java web-application будет скачиваться из репозитория github, поэтому нужно создать credentional.  

Далее генерируем ssh-пару:  

- private key установлен на github  

- public key установлен на jenkins  

Задача будет запускаться с параметрами clean install.  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Jenkins2.jpg)  
После успешного скачивания и создания артефакта, создадим задачу deplay артефакта на удаленный сервер amazon по средством publish over SSH.  

Для этого нужно в конфигурации системы Jenkins указать private key и адресс удаленного сервера amazon  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Jenkins1.jpg)  



После всего проделанного артефакт успешного деплоится на удаленный сервер. 



![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Jenkins3.jpg)  







