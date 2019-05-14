require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/player'

class PlayerTest < MiniTest::Test
  def setup
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_attributes
    assert_equal "Luka Modric", @player.name
    assert_equal "midfielder", @player.position
  end
end
