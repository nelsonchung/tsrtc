#/bin/bash

python crawl.py

datafile="datafile.txt"

nowtime=`date +"%Y%m%d"`
#echo $nowtime
#filename="data/"$nowtime"/"$line".csv"
pathname="data/"$nowtime"/"
ls $pathname > $datafile
while read stocknumberinfo
do
    #echo $pathname$stocknumberinfo
    #echo $stocknumberinfo
    basename $stocknumberinfo ".csv"
    #cat $pathname$stocknumberinfo | tail -n 1 #always output latest one
    data_info=`cat $pathname$stocknumberinfo | tail -n 1`
    echo $data_info
    #nowtime=`cat $data_info | awk -F ',' '{print $1}'`
    nowtime=`cat $pathname$stocknumberinfo | tail -n 1 | awk -F ',' '{print $1}'`
    echo $nowtime
    #nowprice=`cat $data_info | awk -F "," '{print $2}'`
    #nowquantity=`cat $data_info | awk -F "," '{print $3}'`
    #totalquantity=`cat $data_info | awk -F "," '{print $4}'`
    #buyprice=`cat $data_info | awk -F "," '{print $5}'`
    #buyprice_quantity=`cat $data_info | awk -F "," '{print $6}'`
    #sellprice=`cat $data_info | awk -F "," '{print $7}'`
    #sellprice_quantity=`cat $data_info | awk -F "," '{print $8}'`
done < $datafile
