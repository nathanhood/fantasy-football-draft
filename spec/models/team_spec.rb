RSpec.describe Team do
  context "should check validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :league }
  end

end
