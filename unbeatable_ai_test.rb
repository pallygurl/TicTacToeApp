require "minitest/autorun"
require_relative "unbeatable_ai.rb"

class TestUnbeatableAi < Minitest::Test

    def test_create_player
        player = UnbeatableAi.new("x")
        assert_equal("x", player.marker)
    end

    def test_for_o_potential_block_position_0
        player = UnbeatableAi.new("o")
        assert_equal(0, player.get_move([" ", "x", "x", " ", " ", " ", " ", " ", " "]))
    end

     def test_for_o_potential_win_position_6
        player = UnbeatableAi.new("o")
        assert_equal(6, player.get_move(["x", "x", "o", " ", "o", " ", " ", " ", "x"]))
    end

    def test_for_o_potential_win_position_3
        player = UnbeatableAi.new("o")
        assert_equal(3, player.get_move(["x", " ", " ", " ", "o", "o", " ", " ", "x"]))
    end

    def test_for_x_potential_win_position_4
        player = UnbeatableAi.new("x")
        assert_equal(4, player.get_move(["x", "o", "x", " ", " ", " ", "o", " ", "x"]))
    end

    def test_for_o_block_position_8
        player = UnbeatableAi.new("o")
        assert_equal(8, player.get_move(["x", " ", "o", " ", "x", " ", "o", " ", " "]))
    end

    def test_for_x_block_position_5
        player = UnbeatableAi.new("x")
        assert_equal(5, player.get_move(["x", " ", " ", "o", "o", " ", " ", "x", " "]))
    end

    def test_for_x_position_4
        player = UnbeatableAi.new("o")
        assert_equal(4, player.get_move(["x", "o", "x", "o", " ", " ", "x", " ", " "]))
    end

    def test_center_available?
        player = UnbeatableAi.new("o")
        assert_equal(4, player.get_move(["x", "o", "x", "o", " ", " ", " ", " ", " "]))
    end

    def test_go_for_win_0
        player = UnbeatableAi.new("x")
        move = 0
        assert_equal(0, player.get_move([" ","x","x"," "," "," "," "," "," "]))
    end

    def test_go_for_win_4
        player = UnbeatableAi.new("x")
        move = 4
        assert_equal(4, player.get_move(["x"," "," "," "," "," "," "," ","x"]))
    end

    def test_for_o_takes_edge_if_x_opposite_corners
        player = UnbeatableAi.new("o")
        assert_equal(1, player.get_move(["x", " ", " ", " ", "o", " ", " ", " ", "x"]))
    end

    def test_for_o_takes_edge_if_x_takes_other_corners
        player = UnbeatableAi.new("o")
        assert_equal(1, player.get_move([" ", " ", "x", " ", "o", " ", "x", " ", " "]))
    end

    def test_for_x_will_block_win
        player = UnbeatableAi.new("x")
        assert_equal(7, player.get_move(["x", "o", " ", " ", "o", " ", " ", " ", "x"]))
    end 


end