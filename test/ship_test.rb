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

end
