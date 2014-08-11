class Router

  def self.add_commissioner_team_to_league(leagues_controller)
    command = clean_gets
    leagues_controller.add_teams_to_league(command)
  end

  def self.add_teams_to_league(leagues_controller)
    command = clean_gets
    if command == "done"
      players_controller.start_draft
    else
      leagues_controller.add_teams_to_league(command)
    end
  end

end
