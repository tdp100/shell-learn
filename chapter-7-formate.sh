#!/bin/bash

##
# description: 将DOS中的换行转`^M`化为真正的换行符
##

formatePath=$1
echo the path is $formatePath
if [ -f $formatePath ]; then
  vim -c "%s/\r/\r/g" -c wq $formatePath
else
  for i in $( find $formatePath -name "*.js" -type f )
  do
     if [ -f $i ] && [ "${i##*.}" = "js" ]; then
         #sed -i 's/^M//g' $i
         vim -c "%s/\r/\r/g" -c wq $i
     fi
  done
fi



   
