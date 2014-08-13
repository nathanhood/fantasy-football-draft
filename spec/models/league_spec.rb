RSpec.describe League do
  context "should check validations" do
    it { should validate_presence_of(:name).
      with_message("cannot be blank.\nMust enter a league name when program is executed.\nPlease try again.") }
  end

end
