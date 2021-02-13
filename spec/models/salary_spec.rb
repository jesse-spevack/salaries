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
    let(:location) { create(:location) }
    subject(:salary) { create(:salary, location: location) }

    it "returns location name" do
      expect(salary.city).to eq location.name
    end
  end
end
