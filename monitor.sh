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
    nowtime=`echo $data_info | awk -F ',' '{print $1}'`
    #echo $nowtime
    nowprice=`echo $data_info | awk -F "," '{print $2}'`
    #echo $nowprice
    nowquantity=`echo $data_info | awk -F "," '{print $3}'`
    #echo $nowquantity
    totalquantity=`echo $data_info | awk -F "," '{print $4}'`
    #echo $totalquantity
    buyprice=`echo $data_info | awk -F "," '{print $5}'`
    buyprice_a=`echo $buyprice | awk -F "_" '{print $1}'`
    buyprice_b=`echo $buyprice | awk -F "_" '{print $2}'`
    buyprice_c=`echo $buyprice | awk -F "_" '{print $3}'`
    buyprice_d=`echo $buyprice | awk -F "_" '{print $4}'`
    buyprice_e=`echo $buyprice | awk -F "_" '{print $5}'`
    #echo $buyprice
    buyprice_quantity=`echo $data_info | awk -F "," '{print $6}'`
    buyprice_quantity_a=`echo $buyprice_quantity | awk -F "_" '{print $1}'`
    #echo $buyprice_quantity_a
    buyprice_quantity_b=`echo $buyprice_quantity | awk -F "_" '{print $2}'`
    #echo $buyprice_quantity_b
    buyprice_quantity_c=`echo $buyprice_quantity | awk -F "_" '{print $3}'`
    #echo $buyprice_quantity_c
    buyprice_quantity_d=`echo $buyprice_quantity | awk -F "_" '{print $4}'`
    #echo $buyprice_quantity_d
    buyprice_quantity_e=`echo $buyprice_quantity | awk -F "_" '{print $5}'`
    #echo $buyprice_quantity_e
    #echo $buyprice_quantity
    sellprice=`echo $data_info | awk -F "," '{print $7}'`
    sellprice_a=`echo $sellprice | awk -F "_" '{print $1}'`
    #echo $sellprice_a
    sellprice_b=`echo $sellprice | awk -F "_" '{print $2}'`
    #echo $sellprice_b
    sellprice_c=`echo $sellprice | awk -F "_" '{print $3}'`
    #echo $sellprice_c
    sellprice_d=`echo $sellprice | awk -F "_" '{print $4}'`
    #echo $sellprice_d
    sellprice_e=`echo $sellprice | awk -F "_" '{print $5}'`
    #echo $sellprice_e
    sellprice_quantity=`echo $data_info | awk -F "," '{print $8}'`
    sellprice_quantity_a=`echo $sellprice_quantity | awk -F "_" '{print $1}'`
    #echo $sellprice_quantity_a
    sellprice_quantity_b=`echo $sellprice_quantity | awk -F "_" '{print $2}'`
    #echo $sellprice_quantity_b
    sellprice_quantity_c=`echo $sellprice_quantity | awk -F "_" '{print $3}'`
    #echo $sellprice_quantity_c
    sellprice_quantity_d=`echo $sellprice_quantity | awk -F "_" '{print $4}'`
    #echo $sellprice_quantity_d
    sellprice_quantity_e=`echo $sellprice_quantity | awk -F "_" '{print $5}'`
    #echo $sellprice_quantity_e


    #print information
    #加個顏色
    #https://blog.longwin.com.tw/2015/02/bash-shell-color-display-2015/
    echo "成交價: "$nowprice" at "$nowtime" with "$nowquantity" 張" 
done < $datafile
