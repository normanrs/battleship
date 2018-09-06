require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/shot.rb'

class ShotTest <  Minitest::Test
  def test_it_exists
    shot01 = Shot.new("a1", false)
    assert Shot, shot01
  end

  def test_it_has_coordinate
    shot01 = Shot.new("a1", false)
    actual = shot01.coordinate
    expected = "a1"
    assert_equal expected, actual
  end

  def test_it_has_a_hit_status
    shot01 = Shot.new("a1", false)
    actual = shot01.hit
    expected = false
    assert_equal expected, actual
  end

end
