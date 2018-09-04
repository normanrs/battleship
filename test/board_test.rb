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
    board_test0 = Board.new
    puts "board_test0"
    board_test0.place_player_ship("Destroyer", 3)
    actual = board_test0.add_midsection(["a1", "a3"])
    expected = ["a1", "a3", "a2"]
    assert_equal expected, actual
  end

  def test_it_can_add_midsection_vertically
    board_test1 = Board.new
    puts "board_test1"
    board_test1.place_player_ship("Destroyer", 3)
    actual = board_test1.add_midsection(["a1", "c1"])
    expected = ["a1", "c1", "b1"]
    assert_equal expected, actual
  end

  def test_it_can_place_player_ships
    player_board = Board.new
    puts "player_board"
    player_board.place_player_ship("Frigate", 2)
    player_board.place_player_ship("Destroyer", 3)
    require "pry"; binding.pry
  end

end
