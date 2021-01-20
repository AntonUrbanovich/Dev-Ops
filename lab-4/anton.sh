#количество процессов запущенных у данного пользователя
proc=$(ps -u $(whoami) | wc -l)
#процесн загруженности cpu в данный момент
workload=$(ps aux| awk '{sum+= $3;} END { print sum "%";}')
#количество свободной оперативной памяти
freememory=$(free -h|sed -n '2p' | awk '{sum+=$4*1000;}  END {print sum " MB";}')
#количество утсановленных соединений по	произвольному порту
connect=$(netstat -ant | awk '{print $5}' | grep ":443$" -c)
#общий суммарный обьем всех дисковых устройств, установленных в текущий момент на компьютере
allmemory=$( sudo fdisk -l | awk '{sum+= $5/1000000000;} END { print sum " GB";}')
#Общий вывод информации
echo " $proc, $workload, $freememory, $connect, $allmemory "


