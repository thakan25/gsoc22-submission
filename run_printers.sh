#!/bin/bash

cd ~/

name="loca_printer__"

for ((i=1; i<= $1; i++));
    do
	port=$[8000+$i]
	xdotool key Control_L+c ; ippeveprinter -p $port $name$port & 
	#echo $name$port
done
