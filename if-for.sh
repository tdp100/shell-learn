﻿#!/bin/bash

myfunc()
{
  for x in $(ls)
  do
    if [ ! -f "$x" ];then
        echo "$x not a file";
    elif [ $(echo $x | egrep '(.js$)|(.css$)') ];then
        echo "$x";
    else
        cd "$x";
        myfunc;
        cd ..
    fi
  done
}
myfunc
