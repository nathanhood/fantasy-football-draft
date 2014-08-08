RSpec.describe "FDD Main Menu", :integration do
  context "Prints a menu" do
    it "shows a title" do
      actual = run_fdd_with_input()
      expected = %q{
              .-'||'-.
            .'   ||   '.
           /   __||__   \
           | /`-    -`\ |
           | | 6    6 | |
           \/\____7___/\/
   .--------:\:I:II:I:/;--------.
  /          \`:I::I:`/          \
 |            `------'            |
 |             \____/             |
 |      ,    __     ___    ,      |
 |======|   /  |   / _ \   |======|
 |======|   ^| |  | | | |  |======|
 |~~~~~|     | |  | |_| |   |~~~~~|
 |     |\   [___]  \___/   /|     |
  \    \|                  |/    /
  `\    \  _ _.-=""=-._ _  /    /'
    `\   '`_)\\-++++-//(_`'   /'
      ;   (__||      ||__)   ;
       ;   ___\      /___   ;
        '. ---/-=..=-\--- .'
          `""`        `""`
}
      expect(actual).to include(expected)
    end

    context "when we type an incorrect command" do
      let(:output){ run_zss_with_input('remove') }
      it "prints an informative message" do
        expect(output).to include("I don't know the 'remove' command.")
      end
    end

    it "should print the list of training paths" do
      TrainingPath.create(name: "Running")
      TrainingPath.create(name: "Hand-to-Hand Combat")
      TrainingPath.create(name: "Sneaking")
      actual = run_zss_with_input()
      expected = "1. Running\n" +
                 "2. Hand-to-Hand Combat\n" +
                 "3. Sneaking\n"
      expect(actual).to include(expected)
    end

    it "should print graphs that match the progress down the training paths" do
      pending "implementation of skills"
      fail
    end
  end
end
