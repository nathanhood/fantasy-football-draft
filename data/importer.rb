# Run from project root via. `ruby data/importer.rb`
require 'csv'
require_relative '../lib/environment'
require_relative '../app/models/player'

Environment.environment = "development"
source = "data/FantasyPros_2014_QB_RB_WR.csv"

CSV.foreach(source, headers: true) do |row|
  rank = row[0].to_i
  name = row[1]
  position = row[2]
  team = row[3]

  player = Player.create(rank: rank, name: name, position: position, nfl_team: team)
  puts player.name
end
