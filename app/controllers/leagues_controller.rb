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
    league = League.create(name: league_name)
    if league.new_record?
      puts league.errors.full_messages
      exit
    end
    puts "Welcome #{league.name}!\nEnter the commissioner's team name"
    Router.add_commissioner_team_to_league(self)
  end

  def add_teams_to_league(input)
    team = Team.create(name: input)
    if team.new_record?
      puts team.errors.full_messages
    end
    puts "================================"
    puts "#{team.name} added successfully!"
    puts "================================"
    puts "Add another team to the league (type 'done' when finished)"
    Router.add_teams_to_league(self)
  end

end
