#!/bin/bash
# Directory="/opt/goku/services/portal/webapps/ROOT/tenant_copy"
# for file in $Directory/*
# do
# 	if [ ! -f "$file" ] ; then
# 		echo "not a file"
# 	elif [ echo $file | egrep '(.js$)|(.css$)' ] ; then
# 		java -jar yuicompressor-2.4.8.jar --charset UTF-8 $file > ./compresser/$file
# 	else
# 	  echo "not js,css file"
# 	fi
# done

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