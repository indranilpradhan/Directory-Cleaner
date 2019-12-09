#!/bin/bash
directory=$1
flag=$2
if [[ "$flag" == "all" ]] ; then
	#var=ls "$directory"
	#echo "$directory"
	cd "$directory"
	for filep in `ls`
	do
		if [ -f $filep ]; then
			fullfilename="$filep"
			filename=$(basename "$fullfilename")
			ext="${filename##*.}"
			#echo $ext
			#echo "$filep"
			if [ -d "$ext" ] ; then
			find "$directory" -name "*.$ext" -exec mv {} "$ext" \;
			else
			mkdir "$ext"
			find "$directory" -name "*.$ext" -exec mv {} "$ext" \;
			fi
		fi 
	done
else
for i in "${@:2}"
do 
filename=$i
cd "$directory"
if [ -d "$filename" ] ; then
	find "$directory" -name "*.$filename" -exec mv {} "$filename" \;
else
	mkdir "$filename"
	find "$directory" -name "*.$filename" -exec mv {} "$filename" \;
	fi
done
fi	
