#!/bin/bash

FILES=()
EXTENSION=""
REPLACEMENT=""


while [ $# -gt 0 ]; do
	case $1 in
		--file)
			FILES+=("$2")
			shift
			shift
			;;
		--extension)
			EXTENSION=$2
			shift
			shift
			;;
		--replacement)
			REPLACEMENT=$2
			shift
			shift
			;;
		*)
			echo "Unsupported argument $1 with value $2"
			exit 1	
	esac
done

i=0
for file in "${FILES[@]}"; do
	filedir=$(dirname $file)
	filename=$(basename $file)
	if [[ $file == *$EXTENSION ]]; then
		new_filename="${filename%$EXTENSION}$REPLACEMENT"
		mv "${filedir}/$filename" "${filedir}/${new_filename}" 
	fi
done


echo $EXTENSION
echo $REPLACEMENT
