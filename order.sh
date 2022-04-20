#!/bin/bash
#3-18行用于创建目录
cd /root/Routing_Switch/order_file
> /tmp/file 

#file用与存放文件名
for i in $(ls) ; do
    echo $i >> /tmp/file
done

#剪切需要用的文件名放到file1中
cut -d'.' -f1 /tmp/file > /tmp/file1
rm -rf /root/Routing_Switch/order_all/*

#以file1中的字符串创建目录
for i in `cat /tmp/file1` ; do
    mkdir /root/Routing_Switch/order_all/$i
done

#for i in `ls` ; do
#    for j in `ls /root/Routing_Switch/order_all` ; do
#        if [[ $i =~ $j ]] ; then
#            touch /tmp/$j/$(cat /root/Routing_Switch/order_file/$i)
#        fi
#    done
#done

for i in `ls` ; do 
    while read j ; do
        cd /root/Routing_Switch/order_all/
        for k in $(ls) ; do
            [[ $i =~ $k ]] && touch  "/root/Routing_Switch/order_all/$k/$j"
            #[[ $i =~ $k ]] && echo $i,$k
            #echo $i,$k
        done
    done < /root/Routing_Switch/order_file/$i
done

rm -rf /tmp/{file,file1}