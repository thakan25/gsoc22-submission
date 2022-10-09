#!/bin/bash

port=8000

for ((i = 1;i <= $1 ;i++));
	do
	port=$[$i+8000]
	echo killing process at $port
	fuser -k $port/tcp 
done
