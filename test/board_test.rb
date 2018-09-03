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

  def test_it_can_add_midsection_horizontally
    board1 = Board.new
    board1.place_ship("Destroyer", 3)
    actual = board1.add_midsection(["a1", "a3"])
    expected = ["a1", "a3", "a2"]
    assert_equal expected, actual
  end

  def test_it_can_add_midsection_vertically
    board2 = Board.new
    board2.place_ship("Destroyer", 3)
    actual = board2.add_midsection(["a1", "c1"])
    expected = ["a1", "c1", "b1"]
    assert_equal expected, actual
  end

  def test_it_can_place_a_frigate
    board3 = Board.new
    board3.place_ship("Frigate", 2)
  end

end
