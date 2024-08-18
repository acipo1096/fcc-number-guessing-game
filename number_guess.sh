#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n~~ Number Guessing Game ~~\n"

SECRET_NUMBER=$(( RANDOM % 1000 ))
NUMBER_OF_GUESSES=1

echo -e "\nEnter your username:\n"
read USERNAME

# Check if username exists in database
CHECK_USERNAME=$($PSQL "SELECT username FROM user_info WHERE username='$USERNAME';")

if [[ $USERNAME == $CHECK_USERNAME ]]
then
  # Get user info
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM user_info WHERE username='$USERNAME';")
  BEST_GAME=$($PSQL "SELECT best_game FROM user_info WHERE username='$USERNAME';")
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  # Welcome new user
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  ADD_USER_TO_DATABASE=$($PSQL "INSERT INTO user_info(username,games_played,best_game) VALUES('$USERNAME', 0,0)")
fi

echo $SECRET_NUMBER

echo -e "\nGuess the secret number between 1 and 1000:\n"
read SECRET_NUMBER_GUESS

while [[ $SECRET_NUMBER_GUESS != $SECRET_NUMBER ]]
do
  if [[ $SECRET_NUMBER_GUESS =~ [^0-9] ]]
  then
    echo -e "\nThat is not an integer, guess again:\n"
  else
    if (( $SECRET_NUMBER_GUESS < $SECRET_NUMBER ))
    then
      echo -e "\nIt's higher than that, guess again:\n"
    else
      echo -e "\nIt's lower than that, guess again:\n"
    fi
  fi

  # incremement number of guesses variable to keep track of user's progress
  (( NUMBER_OF_GUESSES++ )) 
  read SECRET_NUMBER_GUESS
done

# update user's game info
UPDATE_USER_GAMES_PLAYED=$($PSQL "UPDATE user_info SET games_played=games_played+1 WHERE username='$USERNAME'")

# if new best game, update database
USER_BEST_GAME=$($PSQL "SELECT best_game FROM user_info WHERE username='$USERNAME'")
if [[ $NUMBER_OF_GUESSES -lt $USER_BEST_GAME || $USER_BEST_GAME == 0 ]]
then
  UPDATE_USER_BEST_GAME=$($PSQL "UPDATE user_info SET best_game=$NUMBER_OF_GUESSES")
fi
  
echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!\n"