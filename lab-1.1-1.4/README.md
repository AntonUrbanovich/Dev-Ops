# Работа с packer, Vagrant, Ansible or chef
Создание базового box с Ubuntu 18.04 с помощью packer, выходной формат - vagrant.  
Установка packer, vagrant, virtualbox. C помощью packer создаем box:  
- packer build .\ubuntu.json
при успешном создании box увидим:  

![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/packer.jpg)    







Проверим место хранения box:  

![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/packer2.jpg)  





Запускаем свежую виртуальную машину в vagrant.  

Для этого создадим базовый файл Vagrantfile при помощи команды:  

-vagrant init

После чего, отдерактируем его, прописывая путь, где брать образ virtualbox:  

config.vm.box = "file://..\ubuntu-18.04-1.box"  

Далее запускаем виртуальную машину:  

-vagrant up

Проверяем статус машины:  

-vagrant ssh  

~$cat /etc/os-release  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/vagrant.jpg)  



Добавим Ansible для установки на виртуальной машине следующего ПО:  

- Apache  

- Java  

- Tomcat  

- Mysql(client & server)  



![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/ansible.png)  


Пробросим порты следующим образом: хост:22022->гость:22, хост:22080->гость:80, хост:22443->гость:443, хост:22306->гость:3306.  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/ports.png)  







