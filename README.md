Tic Tac Toe App

The Tic Tac Toe App allows the player to play against another human opponent or the computer.The computer has 3 different difficulties:

Easy - Sequential AI - 
Sequential will take the first available/valid position

Medium - Random AI - 
Random will take a random available/valid position

Hard - Unbeatable AI - 
Cannot be beaten. The player at best can tie. The get_move method found on the unbeatable_ai.rb houses a sequence of method calls. The Unbeatable AI will check the following order:
check_for_win
check_for_block
check_for_fork
block_opponents_fork
check_for_center
opponent_corner
check_empty_corner
check_empty_side

Run app.rb to run the app
