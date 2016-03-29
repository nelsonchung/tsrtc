#/bin/bash

#加個顏色
COLOR_REST='\e[0m' 
COLOR_GREEN='\e[0;32m'; 
COLOR_RED='\e[0;31m';
COLOR_YELLOW='\e[0;33m';
COLOR_WHITE='\e[4;37m';
COLOR_LIGHT_WHITE='\e[1;37m';
#https://blog.longwin.com.tw/2015/02/bash-shell-color-display-2015/

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
    stocknumber=`basename $stocknumberinfo ".csv"`
    echo -e "${COLOR_WHITE}$stocknumber${COLOR_REST}"
    #cat $pathname$stocknumberinfo | tail -n 1 #always output latest one
    data_info=`cat $pathname$stocknumberinfo | tail -n 1`
    #echo -e "${COLOR_LIGHT_WHITE}$data_info${COLOR_REST}"
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
    echo -e "成交價: "${COLOR_YELLOW}$nowprice${COLOR_REST}" at "${COLOR_YELLOW}$nowtime${COLOR_REST}" with "${COLOR_YELLOW}$nowquantity${COLOR_REST}" 張" 
    echo -e "${COLOR_GREEN}\t賣價${COLOR_REST}\t${COLOR_RED}買價${COLOR_REST}"
    echo -e "${COLOR_GREEN}$sellprice_quantity_a\t$sellprice_a${COLOR_REST}\t${COLOR_RED}$buyprice_a\t$buyprice_quantity_a${COLOR_REST}"
    echo -e "${COLOR_GREEN}$sellprice_quantity_b\t$sellprice_b${COLOR_REST}\t${COLOR_RED}$buyprice_b\t$buyprice_quantity_b${COLOR_REST}"
    echo -e "${COLOR_GREEN}$sellprice_quantity_c\t$sellprice_c${COLOR_REST}\t${COLOR_RED}$buyprice_c\t$buyprice_quantity_c${COLOR_REST}"
    echo -e "${COLOR_GREEN}$sellprice_quantity_d\t$sellprice_d${COLOR_REST}\t${COLOR_RED}$buyprice_d\t$buyprice_quantity_d${COLOR_REST}"
    echo -e "${COLOR_GREEN}$sellprice_quantity_e\t$sellprice_e${COLOR_REST}\t${COLOR_RED}$buyprice_e\t$buyprice_quantity_e${COLOR_REST}"
    echo -e "=============================================================================================================================="
done < $datafile
