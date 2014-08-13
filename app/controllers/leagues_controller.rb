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
    Router.add_commissioner_team_to_league(self, league)
  end

  def add_teams_to_league(input, league)
    team = Team.create(name: input, league: league)
    if team.new_record?
      puts team.errors.full_messages
      exit
    end
    puts "================================"
    puts "#{team.name} added successfully!"
    puts "Add another team to the league (type 'done' when finished)"
    Router.add_teams_to_league(self, league)
  end

  def self.draft_menu
    puts %q{
=============================
    Let the Draft Begin!!
=============================
}
    puts IO.readlines('football.txt')
    Router.draft
  end

  def self.round
    league = League.last
    draft_round = league.draft_round.to_i

    if league.round_position == league.teams.length || league.round_position == -1
      draft_round += 1
      if draft_round < 4
        if draft_round.even?
          league.update(draft_round: draft_round, round_position: (league.teams.length - 1))
        elsif draft_round.odd?
          league.update(draft_round: draft_round, round_position: 0)
        end
      else
        puts "================= FINAL DRAFT RESULTS =================="
        league.teams.each do |team|
          puts "#{team.name}"
          team.players.each do |player|
            puts "#{player.position} - #{player.name} #{player.nfl_team}"
          end
          puts "========================================================"
        end
        Player.all.each do |p|
          p.update(team_id: nil)
        end
        exit
      end
    end

    new_league = League.last
    puts "----------ROUND #{new_league.draft_round}-----------"
    self.round_position(league)
  end

  def self.round_position(league)
    round = league.draft_round.to_i
    position = league.round_position.to_i
    team = league.teams[position]
    if round.odd?
      position += 1
    elsif round.even?
      position -= 1
    end
    league.update(round_position: position)
    puts "#{team.name}, it is your turn"
    Router.print_player_menu(team)
  end


end
