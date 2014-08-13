class PlayersController

  def self.print_available_players(input, team)

    input.downcase
    position = ""
    case input
    when "qb"
      position = "QB"
    when "wr"
      position = "WR"
    when "rb"
      position = "RB"
    when "exit"
      exit
    else
      puts "That is not a valid selection. Please type either qb, wr or rb"
      Router.print_player_menu(team)
    end

    players = Player.where(position: position, team_id: nil)
    puts "Rank | Name | Team | Position "
    players.each do |p|
      puts "#{p.rank} - #{p.name} #{p.nfl_team} - #{p.position}"
    end
    puts "Type the rank of player to draft (type 'other' to view a different position)"
    Router.draft_player(position, team)
  end

  def self.draft_player(input, position, team)
    rank = input.to_i
    if rank > 0
      player = Player.find_by(position: position, rank: rank, team_id: nil)
      if !player
        puts "That is not a valid selection!\nYou must enter an available player's rank\n(type 'other' to view a different position)"
        Router.draft_player(position, team)
      else
        player.update(team_id: team.id)
        puts "#{player.name} successfully added to #{team.name}!"
        Router.draft
      end
    end
  end

end
