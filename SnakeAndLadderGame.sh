#!/bin/bash -x

echo "Welcome to Snake And Ladder Game"

START_POSITION=0
No_Move=0
SNAKE=1
LADDER=2

dieRoll=$((1+RANDOM%6))
position=0

while (( $position <= 100 ))
do

	move=$((RANDOM%3))
	case $move in

		$NO_MOVE)
				echo "No Move";;
		$SNAKE)
				position=$(( $position - $dieRoll ))

				if (( $position < 0 ))
				then
						$position=0
				fi;;
		$LADDER)
				position=$(( $position + $dieRoll ));;
	esac
done
