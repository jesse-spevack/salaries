require "rails_helper"

RSpec.describe Location, type: :model do
  describe "validations" do
    subject { build(:location) }

    it { should validate_presence_of(:place_id) }
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should have_many(:salaries) }
  end
end
