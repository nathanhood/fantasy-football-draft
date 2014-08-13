RSpec.describe "Adding player to a team", :integration do
  before do
    Player.create(name: "Jamaal Charles", position: "RB", rank: "1", nfl_team: "KC")
    Player.create(name: "LeSean McCoy", position: "RB", rank: "2", nfl_team: "PHI")
    Player.create(name: "Peyton Manning", position: "QB", rank: "30", nfl_team: "DEN")
    Player.create(name: "Aaron Rodgers", position: "QB", rank: "34", nfl_team: "GB")
    Player.create(name: "Calvin Johnson", position: "WR", rank: "4", nfl_team: "DET")
    Player.create(name: "Dez Bryant", position: "WR", rank: "7", nfl_team: "DAL")
  end

  context "valid input" do
    let!(:output){ run_ffd_with_input("Bills Buckeyes", "Serendipity Sam", "done", "qb", "30", "exit") }
    it "should save the player" do
      team = Team.find_by(name: "Bills Buckeyes")
      player = team.players.first
      expect(player.name).to eq "Peyton Manning"
    end

    it "should print a success message" do
      expect(output).to include "Peyton Manning successfully added to Bills Buckeyes!"
    end
  end

  context "invalid input" do
    let!(:output){ run_ffd_with_input("Bills Buckeyes", "Serendipity Sam", "done", "qb", "400", "exit") }

    it "should print an error message" do
      expect(output).to include "That is not a valid selection!\nYou must enter an available player's rank\n(type 'other' to view a different position)"
    end

    it "should not add a player to a team" do
      team = Team.find_by(name: "Bills Buckeyes")
      expect(team.players.first).to be_nil
    end
  end

  context "chosen player removed from list" do
    let(:output){ run_ffd_with_input("Bills Buckeyes", "Serendipity Sam", "done", "qb", "30", "qb", "30", "exit") }

    it "should mark a player as drafted" do
      expect(output).to include "That is not a valid selection!\nYou must enter an available player's rank\n(type 'other' to view a different position)"
    end
  end

  context "final draft results" do
    let(:output){ run_ffd_with_input("Bills Buckeyes", "Serendipity Sam", "done", "qb", "30", "qb", "34", "wr", "4", "wr", "7", "rb", "1", "rb", "2") }

    it "should print all rosters" do
      expected = %q{
================= FINAL DRAFT RESULTS ==================
Bills Buckeyes
RB - Jamaal Charles KC
QB - Peyton Manning DEN
WR - Dez Bryant DAL
========================================================
Serendipity Sam
RB - LeSean McCoy PHI
QB - Aaron Rodgers GB
WR - Calvin Johnson DET
========================================================
}
      expect(output).to include(expected)
    end
  end

end
