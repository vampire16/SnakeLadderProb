#!/bin/bash -x

echo "Welcome"

#CONSTANT 
PLAYER1=1
PLAYER2=2
playerIndex=1
NOPLAY=0
SNAKE=1
LADDER=2

#VARIABLES
position1=0
position2=0
count1=0
count2=0
index=1

declare -A DiceDictionary

#CHECKING WHICH PLAYER WON THE GAME
while (( position1 < 100 && position2 < 100 ))
do
	for (( playerIndex=1; playerIndex<=PLAYER2; playerIndex++ ))
	do
		if (( playerIndex == 1 ))
		then
			Die=$((RANDOM%6 + 1))
			count1=$(($count1+1))
			randomCheck=$((RANDOM%3))
			case $randomCheck in
			$NOPLAY)
				position1=$(($position1+$NOPLAY))
				;;
			$SNAKE)
				position1=$(($position1-$Die))
				if (( position1 < 0 )); then position1=0; fi
				;;
			$LADDER)
				position1=$(($position1+$Die))
				if (( position1 > 100 )); then position1=$(($position1-$Die)); fi
				;;
			esac
		else
			Die=$((RANDOM%6 + 1))
			count2=$(($count2+1))
			randomCheck=$((RANDOM%3))
			case $randomCheck in
			$NOPLAY)
				position2=$(($position2+$NOPLAY))
				;;
			$SNAKE)
				position2=$(($position2-$Die))
				if (( position2 < 0 )); then position2=0; fi
				;;
			$LADDER)
			position2=$(($position2+$Die))
				if (( position2 > 100 )); then position2=$(($position2-$Die)); fi
				;;
			esac
		fi
	done
done

if (( position1 == 100 ))
then
	echo "player one won"
else
	echo "player two won"
fi
