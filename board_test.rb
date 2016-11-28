require "minitest/autorun"
require_relative "board.rb"


class TestTicTacToeBoard <Minitest::Test
    
    def test_empty_board
        board = Board.new()
        assert_equal(Array.new(9, " "), board.board)
    end

    def test_position_update_x
        board = Board.new()
        board.update("1", "x")
        assert_equal([" ", "x", " ", " ", " ", " ", " ", " ", " "], board.board)
    end

    def test_update_board_o
        board = Board.new
        board.board = [" ","x"," "," "," "," "," "," "," "]
        board.update("0", "o")
        assert_equal(["o","x"," "," "," "," "," "," "," "], board.board)
    end

    def test_valid_position?
        board = Board.new
        board.board = ["o","x"," "," "," "," "," "," "," "]
        assert_equal(false, board.valid_position?("1"))
        assert_equal(true, board.valid_position?("2"))
    end

    def test_valid_input?
        board = Board.new
        assert_equal(false, board.valid_input?("10"))
        assert_equal(false, board.valid_input?("-1"))
        assert_equal(true, board.valid_input?("4"))
        assert_equal(false, board.valid_input?("n"))
    end

    def test_full_board_true
        board = Board.new
        board.board = ["o","x","o","x","o","x","o","x","o"]
        assert_equal(true, board.full_board?)
    end

    def test_full_board_false
        board = Board.new
        board.board = ["o","x","o","x","o","x","o","x"," "]
        assert_equal(false, board.full_board?)
    end

    def test_for_x_winner
        board = Board.new
        board.board = ["x","x","x"," "," "," "," "," "," "]
        symbol = "x"
        assert_equal(true, board.winner?(symbol))
    end

    def test_for_o_winner
        board = Board.new
        board.board = ["o","o","o"," "," "," "," "," "," "]
        symbol = "o"
        assert_equal(true, board.winner?(symbol))
    end

    def test_for_o_winner_false
        board = Board.new
        board.board = ["o","x","o"," "," "," "," "," "," "]
        symbol = "o"
        assert_equal(false, board.winner?(symbol))
    end

    def test_for_x_winner_diagonal_true
        board = Board.new
        board.board = ["x"," "," "," ","x"," "," "," ","x"]
        symbol = "x"
        assert_equal(true, board.winner?(symbol))
    end

    def test_for_x_winner_diagonal_false
        board = Board.new
        board.board = ["x"," "," "," ","o"," "," "," ","x"]
        symbol = "x"
        assert_equal(false, board.winner?(symbol))
    end
end