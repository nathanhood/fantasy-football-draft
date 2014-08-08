class LeaguesController

  def list
    puts %q{
======================
FANTASY FOOTBALL DRAFT
======================
    }
  end

  def ask_for_commissioner_team(input)
    league_name = input.join(' ')
    league = League.new(name: league_name)
    puts "Welcome #{league.name}!\nEnter the commissioner's team name"
    Router.add_teams_to_league(self)
  end

  def add_teams_to_league(input)
    
  end

end
