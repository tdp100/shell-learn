#!/bin/bash
INIT_PATH="/opt/goku/services/portal/webapps/ROOT/tenant_copy"
yuicompressor=$INIT_PATH/yuicompressor-2.4.8.jar
compress=$INIT_PATH/../compress
rm $compress
mkdir $compress
ergodic(){
    for file in `ls $1`
    do
        if [ -d $1"/"$file ]; then
            ergodic $1"/"$file
        elif [ $(echo $file | egrep '(.js$)|(.css$)') ];then
            java -jar $yuicompressor --charset UTF-8 -v "$1"/"$file" > "$compress""$file"
        else
            continue;
       fi
    done
}

ergodic $INIT_PATH