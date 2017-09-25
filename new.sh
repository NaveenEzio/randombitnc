#!/bin/bash
declare -a arr[1023] 
read -p "How many bits to generate " n
for((i=0;i<$n;i++))
do
arr[$i]=$(($RANDOM%2)) 
done
echo ${arr[*]} >>$n.txt
cat $n.txt | tr -d '\n' | tr -d ' ' >> output.bin
fold -w 8 output.bin >>split.bin
v=`cat split.bin`
a=0
b=0
c=0
d=0
e=0
f=0
g=0
h=0
i=0
j=0
h=0
z=0
for x in $v
do
#echo "Binary Value :'$x' "
#echo "hamming weight  of $a bit is "
z=$(echo "$x"  |  tr -cd '1' | wc -c)  
#echo "$z"
if [ $z = 0 ]
then
b=$((b+1))
echo "$x"  >> d0.txt
else if [ $z = 1 ]
then
c=$((c+1))
echo "$x"  >> d1.txt
elif [ $z = 2 ]
then
d=$((d+1))
echo "$x"  >> d2.txt
elif [ $z = 3 ]
then
e=$((e+1))
echo "$x"  >> d3.txt
elif [ $z = 4 ]
then
f=$((f+1))
echo "$x"  >> d4.txt
elif [ $z = 5 ]
then
g=$((g+1))
echo "$x"  >> d5.txt
elif [ $z = 6 ]
then
h=$((h+1))
echo "$x"  >> d6.txt
elif [ $z = 7 ]
then
i=$((i+1))
echo "$x"  >> d7.txt
elif [ $z = 8 ]
then
j=$((j+1))
echo "$x"  >> d8.txt
fi
fi
a=$((a+1))
done

if [ $b -ne 0 ]
then
sort -u d0.txt > 0.txt
fi
if [ $c -ne 0 ]
then
sort -u d1.txt > 1.txt
fi
if [ $d -ne 0 ]
then 
sort -u d2.txt > 2.txt
fi
if [ $e -ne 0 ]
then 
sort -u d3.txt > 3.txt
fi
if [ $f -ne 0 ] 
then
sort -u d4.txt > 4.txt
fi 
if [ $g -ne 0 ]
then
sort -u d5.txt > 5.txt
fi
if [ $h -ne 0 ]
then 
sort -u d6.txt > 6.txt
fi 
if [ $i -ne 0 ]
then
sort -u d7.txt > 7.txt 
fi
if [ $j -ne 0 ]
then
sort -u d8.txt > 8.txt 
fi

echo "vector with hamming weight 0 :$b" 
echo "vector with hamming weight 1 :$c"
echo "vector with hamming weight 2 :$d" 
echo "vector with hamming weight 3 :$e"  
echo "vector with hamming weight 4 :$f"
echo "vector with hamming weight 5 :$g"
echo "vector with hamming weight 6 :$h"
echo "vector with hamming weight 7 :$i"
echo "vector with hamming weight 8 :$j"


v=`cat output.bin`
q=0
b=0
z=0
c=0
x=0
e=0
for x in $v
do
b=$(echo -n $v | wc -c)
echo "the hamming of weight of $b bit is:"
z=$(echo "$x"  |  tr -cd '1' | wc -c) 
echo $z
e=$(echo "$z") 
echo "$e" >> $e.txt
done

for x in $v
do
b=$(echo -n $v | wc -c)
echo "$x"  |  tr -cd '1' >> $e.txt
done


