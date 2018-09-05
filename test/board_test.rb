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

  def test_it_can_add_midsection_vertically
    board_test = Board.new
    actual = board_test.add_midsection(["b4", "d4"])
    expected = ["b4", "d4", "c4"]
    assert_equal expected, actual
  end

  def test_it_can_add_midsection_horizontally
    board_test = Board.new
    actual = board_test.add_midsection(["c2", "c4"])
    expected = ["c2", "c4", "c3"]
    assert_equal expected, actual
  end

  def test_it_checks_diagonal
    board_test = Board.new
    actual = board_test.check_diagonal(["a1", "b2"])
    expected = true
    assert_equal expected, actual
  end

  def test_it_checks_size
    board_test = Board.new
    actual = board_test.check_size(["a1", "a4"], 2)
    expected = true
    assert_equal expected, actual
  end

  def test_it_can_place_player_ships_avoiding_overlap
    player_board = Board.new("Human")
    player_board.place_player_ship("Frigate", 2)
    player_board.place_player_ship("Destroyer", 3)
    actual = player_board.ships.map { |ship| ship.class }
    expected = [Ship, Ship]
    assert_equal expected, actual
  end

  def test_it_can_place_computer_ships_avoiding_overlap
    computer_board = Board.new
    computer_board.place_computer_ship("Frigate", 2)
    computer_board.place_computer_ship("Destroyer", 3)
    actual = computer_board.ships.map { |ship| ship.class }
    expected = [Ship, Ship]
    assert_equal expected, actual
   end

end
