require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_uniqueness_of(:slack_id) }
  end

  describe "associations" do
    it { should have_many(:salaries).dependent(:destroy) }
    it { should have_one(:profile).dependent(:destroy) }
  end

  describe "#display_slack_id" do
    subject(:user) { build(:user) }

    it "returns a shortened id for display" do
      expect(user.display_slack_id).to eq user.slack_id[0..10] + "..."
    end
  end

  describe "#profile_first_or_initialize" do
    subject(:user) { create(:user) }

    context "when profile does not exist" do
      it "returns new profile" do
        expect(user.profile_first_or_initialize).to be_instance_of Profile
      end
    end

    context "when profile exists" do
      let!(:profile) { create(:profile, user: user) }

      it "returns existing profile" do
        expect(user.profile_first_or_initialize).to eq profile
      end
    end
  end
end
