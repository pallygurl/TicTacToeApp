    require_relative 'board.rb'
    require_relative 'console_human.rb'
    require_relative 'console_random_ai.rb'
    require_relative 'console_sequential_ai.rb'
    require_relative 'unbeatable_ai.rb'

class Console_game

    attr_accessor :board, :player_1, :player_2, :current_player

    def initialize
        @board = Board.new
        @player_1 = Console_human.new("X")
        @player_2 = who_plays
        @current_player = player_2
    end

    def who_plays
        puts """
        Who are you playing against? (select one)

<<<<<<< HEAD
        1. Human player
        2. Random
        3. Sequential
        4. Unbeatable
        """
        who = {1 => Console_human, 2 => RandomAI, 3 => SequentialAI, 4 => UnbeatableAI}
        player_choice = gets.chomp.to_i
        player = who[player_choice].new("O")
=======
            Who would you like to play against?

            Press   1 - Human
                    2 - Random AI
                    3 - Sequential AI
                    4 - Unbeatable AI

            Then ENTER!

        """
        who = {1 => Human, 2 => RandomAi, 3 => SequentialAi, 4 => UnbeatableAI}
        choice = gets.chomp.to_i
        player = who[choice].new("o")
>>>>>>> b7072ac7f2c310720d544748605790560610891e
    end

    def change_player
          if @current_player == player_1
           @current_player = player_2
        else
            @current_player = player_1
        end
    end

<<<<<<< HEAD
    def draw_board
    puts """
        
=======
    def print_board
        puts """

>>>>>>> b7072ac7f2c310720d544748605790560610891e
    Let's get started!

    Sample board with numbers:

     1 | 2 | 3
    ---+---+---
     4 | 5 | 6
    ---+---+---
     7 | 8 | 9

    Game Board:
<<<<<<< HEAD
        
=======

>>>>>>> b7072ac7f2c310720d544748605790560610891e
     #{board.grid[0]} | #{board.grid[1]} | #{board.grid[2]}
    -----------
     #{board.grid[3]} | #{board.grid[4]} | #{board.grid[5]}
    -----------
     #{board.grid[6]} | #{board.grid[7]} | #{board.grid[8]}
<<<<<<< HEAD
=======

    #{current_player.marker} --- It's your move
>>>>>>> b7072ac7f2c310720d544748605790560610891e

        """
    end

    def get_move
        current_player.get_move(board.grid)
    end

    def make_move(move)
        board.update(move, current_player.marker)
    end

<<<<<<< HEAD
    def game_over?        
            board.winner?(current_player.marker) || board.full_board?
=======
    def game_over?
        board.winner?(current_player.marker) ||  board.full_board?
>>>>>>> b7072ac7f2c310720d544748605790560610891e
    end

    def end_message
        if 
            board.winner?(current_player.marker)
            puts "#{current_player.marker} is the winner!"
        else
            board.full_board?
            puts "It's a tie!"
        end
    end
<<<<<<< HEAD

=======
>>>>>>> b7072ac7f2c310720d544748605790560610891e
end
