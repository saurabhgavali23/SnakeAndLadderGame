#!/bin/bash -x

echo "Welcome to Snake And Ladder Game"

START_POSITION=0
No_Move=0
SNAKE=1
LADDER=2

position=0
record=1

declare -A gameRecord

while (( $position != 100 ))
do

	dieRoll=$((1+RANDOM%6))
	playerMove=$((RANDOM%3))

	case $playerMove in

		$NO_MOVE)
				echo "No Move";;
		$SNAKE)
				position=$(( $position - $dieRoll ))

				if (( $position < 0 ))
				then
						position=0
				fi;;
		$LADDER)
				position=$(( $position + $dieRoll ))

				if (( $position == 100 ))
				then
						break
				fi;;
	esac

		gameRecord[$record]=$position
		record=$(($record + 1 ))
done

echo ${#gameRecord[@]}
