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

  describe ".from_attributes" do
    context "when attributes are blank" do
      subject { described_class.from_attributes(name: "", place_id: "") }

      it "returns remote location" do
        expect(subject).to be_instance_of described_class
        expect(subject.name).to eq described_class::REMOTE_ATTRIBUTES[:name]
        expect(subject.place_id).to eq described_class::REMOTE_ATTRIBUTES[:place_id]
      end
    end

    context "uses attributes" do
      subject { described_class.from_attributes(name: "Denver, CO, USA", place_id: "abcdef12345") }

      it "returns remote location" do
        expect(subject).to be_instance_of described_class
        expect(subject.name).to eq "Denver, CO, USA"
        expect(subject.place_id).to eq "abcdef12345"
      end
    end

    context "when context already exists" do
      subject { described_class.from_attributes(name: location.name, place_id: location.place_id) }

      let!(:location) { create(:location) }

      it "returns remote location" do
        expect(subject).to eq location
      end
    end
  end
end
