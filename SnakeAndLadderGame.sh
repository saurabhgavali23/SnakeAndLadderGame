#!/bin/bash -x

echo "Welcome to Snake And Ladder Game"

START_POSITION=0
NO_MOVE=0
SNAKE=1
LADDER=2

function checkWhoIsWinner(){

	position=$1
	dieCount=$2
	dieRoll=$((1+RANDOM%6))
	playerMove=$((RANDOM%3))

	case $playerMove in

		$NO_MOVE)
				position=$(( $position + 0 ));;

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

		((dieCount++))
		echo $dieCount $position
}

function main(){

	player1Pos=0
	player2Pos=0
	totalDice1=0
	totalDice2=0
	dieCount=0

	while (( $player1Pos != 100 && $player2Pos != 100 ))
	do
			read totalDice1 player1Pos < <( checkWhoIsWinner $player1Pos $totalDice1 )
			totalDice2=$(( $totalDice1 + $dieCount ))

			read totalDice2 player2Pos < <( checkWhoIsWinner $player2Pos $totalDice2 )
			totalDice2=$(( $totalDice2 + $dieCount ))
	done

	echo "Player 1 Total Dice $totalDice1"
	echo "Player 2 Total Dice $totalDice2"

	if (( $player1Pos > $player2Pos ))
	then
		echo "Player 1 Winner"
	else
		echo "Player 2 Winner"
	fi
}

main
