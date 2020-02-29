#!/bin/bash -x

echo "Welcome"
#CONSTANT 
PLAYER=1
NOPLAY=0
SNAKE=1
LADDER=2

#VARIABLES
position=0

#RANDOM FUNCTION
Die=$((RANDOM%6 + 1))
echo "$Die"

#CHECKING FOR OPTIONS
randomCheck=$((RANDOM%3))
case $randomCheck in
$NOPLAY)
	NOPLAY=$(($position+$NOPLAY))
	;;
$SNAKE)
	SNAKE=$(($position-$Die))
	;;
$LADDER)
	LADDER=$(($position+$Die))
	;;
esac
