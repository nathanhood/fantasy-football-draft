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
end
