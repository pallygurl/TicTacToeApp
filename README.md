Tic Tac Toe App

The Tic Tac Toe App allows the player to play against another human opponent or the computer. 
Playing against the computer allows you to choose from 3 different difficulty levels:

Easy - Sequential AI - which will take the first available/valid position

Medium - Random AI - which will take a randomly available/valid position

Hard - Unbeatable AI - which cannot be beaten. The player at best can tie. The get_move method found on the unbeatable_ai.rb houses a sequence of method calls. The Unbeatable AI will check the following order:
check_for_win, 
check_for_block, 
check_for_fork, 
block_opponents_fork, 
check_for_center, 
check_empty_corner, 
check_empty_side.

Run app.rb to run the app
