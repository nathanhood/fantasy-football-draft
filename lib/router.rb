class Router

  def self.add_commissioner_team_to_league(leagues_controller, league)
    command = clean_gets
    leagues_controller.add_teams_to_league(command, league)
  end

  def self.add_teams_to_league(leagues_controller, league)
    command = clean_gets
    if command == "done"
      LeaguesController.draft_menu
    else
      leagues_controller.add_teams_to_league(command, league)
    end
  end

  def self.draft
    LeaguesController.round
  end

  def self.print_player_menu(team)
    puts "Type 'qb', 'wr' or 'rb' to view available players."
    command = clean_gets
    PlayersController.print_available_players(command, team)
  end

  def self.draft_player(position, team)
    command = clean_gets
    if command == "other"
      Router.print_player_menu(team)
    else
      PlayersController.draft_player(command, position, team)
    end

  end

end
