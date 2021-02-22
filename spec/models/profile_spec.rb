require "rails_helper"

RSpec.describe Profile do
  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_inclusion_of(:graduation_year).in_array(described_class::VALID_GRADUATION_YEARS) }
    it { should validate_inclusion_of(:program).in_array(described_class::VALID_PROGRAMS) }
  end
end
