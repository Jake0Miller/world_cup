class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.inject([]) do |players, team|
      players.push(*(team.players_by_position(position))) if !team.eliminated?
      players
    end
  end

  def all_players_by_position
    players = Hash.new
    @teams.each do |team|
      team.players.each do |player|
        players[player.position] ||= []
        players[player.position] << player
      end
    end
    players
  end
end
