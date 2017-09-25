#!/bin/bash
declare -a arr[1023] 
read -p "How many bits to generate " n
for((i=0;i<$n;i++))
do
arr[$i]=$(($RANDOM%2)) 
done
echo ${arr[*]} >>$n.txt
cat $n.txt | tr -d '\n' | tr -d ' ' >> output.bin
nc -v -l 7006 <output.bin
