Создание базового box с Ubuntu 18.04 с помощью packer, выходной формат - vagrant.  
Установка packer, vagrant, virtualbox. C помощью packer создаем box:  
- packer build .\ubuntu.json
при успешном создании box увидим:  









Проверим место хранения box:  







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









