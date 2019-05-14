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

  def test_attributes
    assert_equal "France", @team.country
    refute @team.eliminated?
    assert_equal [], @team.players
  end

  def test_it_gets_deleted
    @team.eliminated = true
    assert @team.eliminated?
  end

  def test_it_holds_players
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @team.add_player(mbappe)
    @team.add_player(pogba)

    assert_equal [mbappe, pogba], @team.players
    assert_equal [], @team.players_by_position("defender")
    assert_equal [mbappe], @team.players_by_position("forward")
    assert_equal [pogba], @team.players_by_position("midfielder")
  end
end
