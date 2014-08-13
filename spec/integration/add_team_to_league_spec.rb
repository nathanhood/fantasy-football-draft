RSpec.describe "Adding team to a league", :integration do
  context "valid input" do
    # let!(:team1){ Team.create(name: "Bills Buckeyes") }
    # let!(:team2){ Team.create(name: "Serendipity Sam") }
    let!(:output){ run_ffd_with_input("Bills Buckeyes", "Serendipity Sam", "done", "exit") }

    it "should save the team" do
      team = Team.first
      expect(team.name).to eq "Bills Buckeyes"
    end
  end

  context "invalid input" do
    let!(:output){ run_ffd_with_input("") }

    it "should print an error message" do
      expect(output).to include "Name can't be blank"
    end

    it "should not create a team" do
      expect(Team.count).to eq 0
    end
  end

  context "team belongs to a league" do
    let!(:output){ run_ffd_with_input("Bills Buckeyes", "Serendipity Sam", "done", "exit") }

    it "should have two teams in league" do
      actual = League.last.teams.count
      expect(actual).to eq 2
    end
  end
end
