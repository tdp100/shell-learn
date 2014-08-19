#!/bin/bash


echo -n "Enter your number: "
read num

if [ "$num" -eq 10 ]
then
   echo "That is a good Number"
elif [ "$num" -eq 20 ]
then
   echo "that is a good number"
else
   echo "i dont like that number very much"
fi
