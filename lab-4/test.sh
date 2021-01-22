#!/bin/bas
function create_page {
name=$(cat /dev/urandom | tr -cd 'a-zA-Z0-9' | head -c 8)
mkdir $name
cd $name
}

function create_file {
name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 8)
file_size=$(( 1+ $RANDOM % 10 ))
dd if=/dev/zero of=$name.txt bs=1 count=$file_size
}

create_page
count=5

for ((i=1; i<= $count; i++)) 
do 
create_page
for(( a=1; a<= $count; a++))
do 
create_file 
done
cd ..
done
