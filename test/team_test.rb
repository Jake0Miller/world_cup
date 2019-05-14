require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/player'
require './lib/team'

class TeamTest < MiniTest::Test
  def setup
    @team = Team.new("France")
  end

  def test_it_exists
    assert_instance_of Team, @team
  end
end
