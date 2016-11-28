require "minitest/autorun"
require_relative "console_game.rb"


class TestTicTacToeConsoleGame <Minitest::Test

    def test_change_player
        game = Game.new(player_1, player_2)
        game.current_player = player_2
        assert_equal(player_1, game.current_player)
    end
end