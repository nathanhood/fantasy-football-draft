RSpec.describe "FFD Main Menu", :integration do
  context "Prints a greeting" do
    it "shows a title" do
      actual = run_ffd_with_input()
      expected = %q{
======================
FANTASY FOOTBALL DRAFT
======================
}
      expect(actual).to include(expected)
    end

    it "prints the league name that was created at runtime" do
      actual = run_ffd_with_input()
      expected = "Welcome Ballers League!\nEnter the commissioner's team name"
      expect(actual).to include(expected)
    end
  end

  context "Invalid content" do
    it "should print an error message and exit application" do
      actual = `./ffd`
      expected = "cannot be blank.\nMust enter a league name when program is executed.\nPlease try again."
      expect(actual).to include(expected)
    end

    it "should not create a league" do
      expect(League.count).to eq 0
    end
  end
end
