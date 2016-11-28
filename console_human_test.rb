require "minitest/autorun"
require_relative "console_human.rb"


class TestConsoleHuman <Minitest::Test

    def test_console_human_player
        player = Human.new("x")
        assert_equal("x", player.marker)
    end

    def test_make_a_move
        player = Human.new("x")
        move = player.get_move(Array.new(9, " "))
        assert_equal(true, [0, 1, 2, 3, 4, 5, 6, 7, 8].include?(move))
    end
end