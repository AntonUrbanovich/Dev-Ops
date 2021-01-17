# Работа с Amazon:  

- Создаём выделенную сеть Amazon Virtual Private Cloud с тремя подсетями в 2 разных зонах. 2 подсети будут public, 1 private.  

![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Amazon1.jpg)  


- Создаем Internet Gateway.  
- В 2 subnets устанавливаем auto-assign public IPv4 address.  

![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Amazon2.jpg)  


- Создаем 2 NAT Gateways для доступа в интернет.    

- Создаем 2 Route Tables.  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Amazon7.jpg)  


Генерируем собственный RSA ключ и создаем Security Group.  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Amazon3.jpg)  

Создаём два t2.micro инстанса в созданной в п 6.1 VPC для 2 public subnets.  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Amazon4.5.jpg)  

На оба инстанса устанавливаем nginx и создаём простую страницу-заглушку (index.html) на 80-ом порту.  




![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Amazon8.jpg)  






![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Amazon9.jpg)  




Создаём один ELB с поддержкой созданных Availability Zones, разрешаем HTTP трафик на LB с любого IP адреса, добавляем в ELB оба инстанса, настроиваем Health Check на протокол HTTP, порт 80, страница index.html с минимальными интервалами проверки.  

![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Amazon5.jpg)  

Принудительно остановливаем веб-сервер на одном из инстансов и проверяем доступность сайта.  


![Image alt](https://github.com/impalla215/Dev-Ops/blob/master/screens/Amazon6.jpg)  





