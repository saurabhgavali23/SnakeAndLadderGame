#!/bin/bash -x

echo "Welcome to Snake And Ladder Game"

START_POSITION=0
No_Move=0
SNAKE=1
LADDER=2

dieRoll=$((1+RANDOM%6))
position=0
msl=$((RANDOM%3))

case $msl in

	$NO_MOVE)
			echo "No Move";;
	$SNAKE)
			position=$(( $position - $dieRoll ));;
	$LADDER)
			position=$(( $position + $dieRoll ));;
esac
