require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game.rb'

class GameTest < Minitest::Test
  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_creates_computer_board
    game = Game.new
    game.create_computer_board
    actual = game.boards[0].player
    expected = "computer"
    assert_equal expected, actual
  end

  def test_it_creates_player_board
    skip
    game = Game.new
    game.create_computer_board
    game.create_player_board
    actual = game.boards[1].player
    expected = "human"
    assert_equal expected, actual
  end

  def test_it_shoots_at_computer
    skip
    game = Game.new
    game.create_computer_board
    game.create_player_board
    game.shoot_at_computer("a1")
    actual = game.shots_at_computer.count
    expected = 1
    assert_equal expected, actual
  end

  def test_it_finds_other_shots
    skip
    game = Game.new
    game.create_computer_board
    game.create_player_board
    game.shoot_at_computer("a1")
    game.shoot_at_computer("a1")
    actual = game.shots_at_computer.count
    expected = 1
    assert_equal expected, actual
  end

  def test_it_holds_a_bunch_of_shots
    game = Game.new
    game.create_computer_board
    game.create_player_board
    game.shoot_at_computer("a1")
    game.shoot_at_computer("a2")
    game.shoot_at_computer("a3")
    game.shoot_at_computer("a4")
    game.shoot_at_computer("b1")
    actual = game.shots_at_computer.count
    expected = 5
    assert_equal expected, actual
  end


end
