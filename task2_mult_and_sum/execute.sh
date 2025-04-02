#!/bin/bash

NUMBER=$1
SUM=0
MULT=1


if [ $NUMBER -gt -0 ]; then
	#mult
	for ((i=1; i <= (($NUMBER/2)); i++))
	do
		MULT=$((MULT*i))
	done

	#sum
	for ((i=(($NUMBER+1)/2+1); i <= $NUMBER; i++))
	do
		SUM=$((SUM+i))
	done
else
	echo "Number should be >= 0"
	exit 1
fi

echo "mult: $MULT"
echo "sum: $SUM"
echo "Correct program finish"


