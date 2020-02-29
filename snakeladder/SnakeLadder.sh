#!/bin/bash -x

echo "Welcome"

#CONSTANT 
PLAYER=1
NOPLAY=0
SNAKE=1
LADDER=2

#VARIABLES
position=0
count=0
index=1

declare -A DiceDictionary

#CHECKING FOR OPTIONS AND REPEATING DIE TILL PLAYER REACHES THE WINNING POSITION
while (( position < 100 ))
do
	Die=$((RANDOM%6 + 1))
	count=$(($count+1))
	randomCheck=$((RANDOM%3))
	case $randomCheck in
	$NOPLAY)
		position=$(($position+$NOPLAY))
		;;
	$SNAKE)
		position=$(($position-$Die))
		if (( position < 0 )); then position=0; fi
		;;
	$LADDER)
		position=$(($position+$Die))
		if (( position > 100 )); then position=$(($position-$Die)); fi
		;;
	esac
	DiceDictionary[$count]=$position
done

#PRINTING NUMBER OF DICE AND POSITION AFTER EVERY DICE ROLE
while (( $index <= $count ))
do
	echo "$index---->${DiceDictionary[$index]}"
	index=$(($index+1))
done
