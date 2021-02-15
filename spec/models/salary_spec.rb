require "rails_helper"

RSpec.describe Salary, type: :model do
  describe "validations" do
    subject { build(:salary) }

    it { should validate_numericality_of(:amount).is_greater_than(10_000).only_integer }
    it { should validate_presence_of(:amount) }

    describe "start date" do
      it "cannot be in the future" do
        expect {
          create(:salary, start_date: 1.day.from_now)
        }.to raise_error(ActiveRecord::RecordInvalid, /Start date must not be in the future./)
      end
    end

    describe "end date" do
      it "cannot be before the start date" do
        expect {
          create(:salary, start_date: 1.day.ago, end_date: 1.day.ago)
        }.to raise_error(ActiveRecord::RecordInvalid, /End date must be after the start date./)
      end

      it "must be blank if salary is current salary" do
        expect {
          create(:salary, :current, end_date: 1.day.ago)
        }.to raise_error(ActiveRecord::RecordInvalid, /End date must be blank when this is a current salary./)
      end

      it "can have blank end date if salary is current salary" do
        expect(create(:salary, :current, end_date: nil)).to be_valid
      end
    end
  end

  describe "associations" do
    subject { build(:salary) }

    it { should belong_to(:user) }
    it { should belong_to(:location).optional }
  end

  describe "#city" do
    context "when location is present" do
      subject(:salary) { create(:salary, location: location) }
      let(:location) { create(:location) }

      it "returns location name" do
        expect(salary.city).to eq location.name
      end
    end

    context "when location is nil" do
      subject(:salary) { create(:salary, location: nil) }

      it "returns remote" do
        expect(salary.city).to eq "Remote"
      end
    end
  end

  describe "before_save" do
    context "when save change to remote" do
      subject(:salary) { create(:salary) }

      it "sets location to nil" do
        expect { salary.update(remote: true) }.to change { salary.location }.from(kind_of(Location)).to(nil)
      end
    end
  end

  describe "location_attributes=" do
    subject(:salary) { create(:salary, location: location) }

    let!(:location) { create(:location) }

    context "when one or more attribute is blank" do
      let(:attributes) { {"place_id" => ""} }

      it "sets location association to nil" do
        expect { salary.location_attributes = attributes }.to change { salary.location }.from(kind_of(Location)).to(nil)
      end
    end

    context "when all attributes are present" do
      let(:attributes) { {"place_id" => "123", "name" => "my place"} }

      it "sets location association to nil" do
        expect { salary.location_attributes = attributes }.to change { Location.count }.from(1).to(2)
      end
    end
  end
end
