#!/bin/bash

root_dir='/home/yi/test/'
IFS_OLD=$IFS

IFS=$'\t,\n'

folder_list=($root_dir)
folder_num=1
total_num=1
count=0
while [ "${#folder_list[@]}" -ne 0 ];
do
    temp=$folder_num
    for i in `seq $count $(($folder_num-1))`
    do
        root_dir=${folder_list[$i]}
        items=`ls $root_dir`
        echo "[$root_dir]"
        for item in $items
        do
            echo "$root_dir$item"
            let "total_num++"
        done
        echo ""
        folders=`ls -F $root_dir | grep /`
        for folder in $folders
        do
            echo $folder
            folder_list[$folder_num]="$root_dir$folder"
            let "folder_num++"
        done
        unset folder_list[$i]
    done
    count=$temp
done

echo "[ Directories Count ]:$folder_num"
echo ""
echo "[ Files Count ]:$(($total_num - $folder_num))"

IFS=$IFS_OLD
