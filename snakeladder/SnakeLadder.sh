#!/bin/bash -x

echo "Welcome"
#CONSTANT 
PLAYER=1

#VARIABLES
position=0

#RANDOM FUNCTION
Die=$((RANDOM%6 + 1))
echo "$Die"
