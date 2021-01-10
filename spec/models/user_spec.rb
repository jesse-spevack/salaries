require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_uniqueness_of(:slack_id) }
  end

  describe "associations" do
    it { should have_many(:salaries) }
    it { should have_one(:profile) }
  end

  describe "display_slack_id" do
    subject(:user) { build(:user) }

    it "returns a shortened id for display" do
      expect(user.display_slack_id).to eq user.slack_id[0..10] + "..."
    end
  end
end
