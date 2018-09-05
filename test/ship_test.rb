require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship.rb'

class ShipTest  <  Minitest::Test
  def test_it_exists
    ship_1 = Ship.new("Frigate", ["a1", "a2"])
    assert Ship, ship_1
  end

  def test_it_has_a_name
    ship_1 = Ship.new("Frigate", ["a1", "a2"])
    actual = ship_1.name
    expected = "Frigate"
    assert_equal expected, actual
  end

  def test_it_has_coordinates
    ship_1 = Ship.new("Frigate", ["a1", "a2"])
    actual = ship_1.placement
    expected = ["a1", "a2"]
    assert_equal expected, actual
  end

  def test_it_is_afloat_by_default
    ship_1 = Ship.new("Frigate", ["a1", "a2"])
    actual = ship_1.afloat
    expected = true
    assert_equal expected, actual
  end

  def test_it_can_sink
    ship_1 = Ship.new("Frigate", ["a1", "a2"])
    actual = ship_1.sink
    expected = false
    assert_equal expected, actual
  end

  # def print_board
  #   puts "==========="
  #   puts ".  1 2 3 4"
  #   puts "A"
  #   puts "B"
  #   puts "C"
  #   puts "D"
  #   puts "==========="
  # end

  # puts "I have laid out my ships on the grid."
  # puts "You now need to layout your two ships"
  # puts "The first is two units long and the"
  # puts "second is three units long."
  #

end
