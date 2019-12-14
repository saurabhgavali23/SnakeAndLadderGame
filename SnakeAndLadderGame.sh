#!/bin/bash -x

echo "Welcome to Snake And Ladder Game"

START_POSITION=0
No_Move=0
SNAKE=1
LADDER=2

position=0
record=1
totalDice=0

function checkWhoIsWinner(){

	while (( $position < 100 ))
	do

		dieRoll=$((1+RANDOM%6))
		playerMove=$((RANDOM%3))

		case $playerMove in

			$NO_MOVE)
					echo "No Move";;

			$SNAKE)
					position=$(( $position - $dieRoll ))

					if (( $position < $START_POSITION ))
					then
						position=$START_POSITION
					fi;;

			$LADDER)
					position=$(( $position + $dieRoll ))

					if (( $position > 100 ))
					then
						position=$(( $position - $dieRoll ))
					fi;;
		esac

			totalDice=$(( $totalDice + 1 ))
	done

	echo $totalDice
}

function main(){

	player1=$( checkWhoIsWinner )
	player2=$( checkWhoIsWinner )

	echo "Player 1 Total Dice $player1"
	echo "Player 2 Total Dice $player2"

	if(( $player1 < $player2 ))
	then
		echo "Player 1 Winner"
	else
		echo "Player 2 Winner"
	fi
}

