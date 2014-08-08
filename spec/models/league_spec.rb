RSpec.describe League do
  context "should check validations" do
    it { should validate_presence_of :name }
  end

end
