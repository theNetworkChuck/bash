#!/bin/bash

for x in $(cat countries.txt);
do
	weather=$(curl -s http://wttr.in/$x?format=3)
	echo "The weather for $weather"
done

