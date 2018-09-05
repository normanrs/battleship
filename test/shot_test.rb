require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/shot.rb'

class ShotTest <  Minitest::Test
  def test_it_exists
    shot01 = Shot.new("a1")
    assert Shot, shot01
  end

  def test_it_has_coordinate
    shot01 = Shot.new("a1")
    actual = shot01.coordinate
    expected = "a1"
    assert_equal expected, actual
  end

  def test_it_is_a_miss_by_default
    shot01 = Shot.new("a1")
    actual = shot01.hit
    expected = false
    assert_equal expected, actual
  end

  def test_it_can_be_a_hit
    shot01 = Shot.new("a1", true)
    actual = shot01.hit
    expected = true
    assert_equal expected, actual
  end

end
