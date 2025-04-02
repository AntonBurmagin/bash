#!/bin/bash

FILE=""
SEARCH=""

while [ $# -gt 0 ]; do
	case $1 in
		--file)
			FILE="$2"
			shift
			shift
			;;
		--search)
			SEARCH="$2"
			shift
			shift
			;;
		*)
			echo "Argument $1 is not supported"
			exit 1
	esac
done	

COUNT=0
while read -r line; do
	LINE="$line"
	if [[ $LINE == *$SEARCH* ]]; then
		((COUNT++))
	fi
done < $FILE

if [[ $COUNT > 0 ]]; then
	echo "Количество найденных подстрок \"$SEARCH\" = $COUNT"
else
	echo "Не найдено ни одного совпадения с подстрокой \"$SEARCH\" в файле <$(realpath $FILE)>"
fi

