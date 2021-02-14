require "rails_helper"

RSpec.describe Location, type: :model do
  describe "validations" do
    subject { build(:location) }

    it { should validate_presence_of(:place_id).with_message("city must be chosen from drop down") }
    it { should validate_presence_of(:name).with_message("city must be present") }
  end

  describe "associations" do
    it { should have_many(:salaries) }
  end
end
