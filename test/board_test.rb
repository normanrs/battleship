require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board.rb'

class BoardtTest <  Minitest::Test
  def test_it_exists
    player_board = Board.new
    assert Board, board
  end



end
