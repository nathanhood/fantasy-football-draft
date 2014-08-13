RSpec.describe Player do
  context "should check validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :position }
    it { should validate_presence_of :rank }
    it { should validate_presence_of :nfl_team }
  end

end
