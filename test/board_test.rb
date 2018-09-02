require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board.rb'

class BoardtTest <  Minitest::Test
  def test_it_exists
    player_board = Board.new
    assert Board, player_board
  end

  def test_it_has_a_layout
    player_board = Board.new
    actual = player_board.layout
    expected = ["a1", "a2", "a3", "a4",
                "b1", "b2", "b3", "b4",
                "c1", "c2", "c3", "c4",
                "d1", "d2", "d3", "d4"]
    assert_equal expected, actual
  end

  def test_it_can_place_a_ship
    player_board = Board.new
    player_board.place_ship("Frigate", 2)
    
  end

end
