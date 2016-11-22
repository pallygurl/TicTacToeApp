# Win: If the player has two in a row, they can place a third to get three in a row.
# Block: If the opponent has two in a row, the player must play the thrid themselves to block the opponent.
# Fork: Create an opportunity where the player has two threats to win (two non-blocked lines of 2).
# Blocking an opponent's fork:
    # Option 1: The player should create two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork. For example, if "X" has a corner, "O" has the center, and "X" has the opposite corner as well, "O" must not play a corner in order to win. (Playing a corner in this scenario creates a fork for "X" to win.)

    # Option 2: If there is a configuration where the opponent can fork, the player should block that fork.

# Center: A player marks the center. (If it is the first move of the game, playing on a corner gives "O" more opportunities to make a mistake and may therefore be the better choice; however, it makes no difference between perfect players.)

# Opposite corner: If the opponent is in the corner, the player plays the opposite corner.
# Empty corner: The player plays in a corner square.

# Empty side: The player plays in a middle square on any of the 4 sides.


class UnbeatableAI
    attr_accessor :marker, :open_spot


    def initialize(marker)
        @marker = marker
        @open_spot = 10
    end


    def get_move(board)
        comp_marker = marker

        if comp_marker == "O"
            player_marker = "X"
        else
            player_marker = "O"
        end

        if potential_win_block(board, comp_marker) <= 8
            move = potential_win_block(board, comp_marker)
        
        elsif potential_win_block(board, player_marker) <= 8
            move = potential_win_block(board, player_marker)
        
        elsif check_for_fork(board) <= 8
            move = check_for_fork(board)

        elsif block_opponents_fork(board, comp_marker) <= 8
            move = block_opponents_fork(board, comp_marker)
        
        elsif check_for_center(board)
            move = check_for_center(board)
       
        elsif check_for_empty_corner_if_center_taken(board)
            move = check_for_empty_corner_if_center_taken(board) 
        
        elsif strategy_opposite_corners(board)
            move = strategy_opposite_corners(board)
       
        # elsif check_for_fork(board) <= 8
        #         move = check_for_fork(board)
        # elsif block_opponents_fork(board, comp_marker) <= 8
        #         move = block_opponents_fork(board, comp_marker)
        else edge_space(board)
            move = edge_space(board)
        end
      move
		# 	elsif check_empty_corner(board)
		# 		move = check_empty_corner(board)

		# 	elsif check_empty_side(board)
		# 		move = check_empty_side(board)

        #     else
        #         move = board.index("")
        #     end
        # move
    end

    def win_combinations(board)
        [
            [board[0],board[1],board[2]],
            [board[3],board[4],board[5]],
            [board[6],board[7],board[8]],
            [board[0],board[3],board[6]],
            [board[1],board[4],board[7]],
            [board[2],board[5],board[8]],
            [board[0],board[4],board[8]],
            [board[2],board[4],board[6]]
        ]
    end

    def win_positions
        win_position = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    end

    def potential_win_block(board, current_marker)
        @open_spot = 10

        win_combinations(board).each_with_index do |win_line, index|
            if win_line.count(current_marker) == 2 && win_line.count(" ") == 1
                space_in_winning_line = win_line.index(" ")
                @open_spot = win_positions[index][space_in_winning_line]
            end
        end
        open_spot
    end

    def check_for_fork(board)
		@open_spot = 10
		fork_line = []
		fork_spot = []
		i = []
		
		win_combinations(board).each_with_index do |forking_line, index|
			if forking_line.count(marker) == 1 && forking_line.count("") == 2

				i.push(index)
			end
		end

		i.each do |index|
			fork_spot.push(win_positions[index])
		end

		fork_spot = fork_spot.flatten.sort

		fork_spot.each do |spot|
			if board[spot] == ""
				fork_line.push(spot)
			end
		end

		if fork_line.detect { |match| fork_line.count(match) > 1 } == nil
            open_spot = 10
		else
			open_spot = fork_line.detect { |match| fork_line.count(match) > 1 }
		end
        open_spot
	end

      def block_opponents_fork(board, comp_marker)
		@open_spot = 10
        comp_marker = marker

		if comp_marker == "O"
			player_marker = "X"
		else
			player_marker = "O"
		end

		fork_line = []
		fork_spot = []
		i = []
		
		win_combinations(board).each_with_index do |forking_line, index|
			if forking_line.count(player_marker) == 1 && forking_line.count("") == 2
				# fork_line = forking_line
				i.push(index)
			end
		end

		i.each do |index|
			fork_spot.push(win_positions[index])
		end

		fork_spot = fork_spot.flatten

		block_spot = []
		fork_spot.each do |spot|
			if board[spot] == ""
				block_spot.push(spot)
			end
		end

        if block_spot.detect {|match| block_spot.count(match) > 1} == nil
            open_spot = 10
        else
            open_spot = block_spot.detect {|match| block_spot.count(match) > 1}
        end
        open_spot
	end
    
    def check_for_center(board)
        if board[4] == " "
            @open_spot = 4
        elsif board[4] != " "
            @open_spot = check_for_empty_corner_if_center_taken(board)
        end
    end

    def check_for_empty_corner_if_center_taken(board)
        corners = [0, 2, 6, 8]
        corners.each do |corner|
            if board[corner] == " "
                @open_spot = corner
                break
            end
        end
     open_spot
    end

    def strategy_opposite_corners(board)
      if board[0] && board[8] == "X"
        @open_spot = 1
      elsif board[2] && board[6] == "X"
        @open_spot =7  
      end
    open_spot
    end

    def edge_space(board)
      @open_spot = 10
        edges = [1, 3, 5, 7]
        edges.each do |edge|
            if board[edge] == " "
                @open_spot = edge
                break
            end
        end
    open_spot
    end
end
