require "rails_helper"

describe SalaryReportingService do
  subject(:service) { described_class.new }

  describe "#current_salary_by_graduation_year" do
    before do
      user_2017_1 = create(:user, profile: create(:profile, graduation_year: 2017))
      user_2017_2 = create(:user, profile: create(:profile, graduation_year: 2017))
      user_2018 = create(:user, profile: create(:profile, graduation_year: 2018))

      create(:salary, :remote, user: user_2017_1, start_date: "2017-03-20", end_date: "2018-06-01", amount: 75000)
      create(:salary, :remote, user: user_2017_1, start_date: "2018-06-20", end_date: nil, current_salary: true, amount: 95000)

      create(:salary, :remote, user: user_2017_2, start_date: "2018-06-20", end_date: nil, current_salary: true, amount: 105000)

      create(:salary, :remote, user: user_2018, start_date: "2018-03-20", end_date: nil, current_salary: true, amount: 85000)
    end
    let(:result) { service.current_salary_by_graduation_year }
    let(:expected1) do
      {
        "graduation_year" => 2017,
        "submission_count" => 2,
        "average_salary" => 100000,
        "minimum_salary" => 95000,
        "maximum_salary" => 105000
      }
    end

    let(:expected2) do
      {
        "graduation_year" => 2018,
        "submission_count" => 1,
        "average_salary" => 85000,
        "minimum_salary" => 85000,
        "maximum_salary" => 85000
      }
    end

    it "returns salaries by years of experience" do
      expect(result.count).to eq 2
      expect(result.first).to eq expected1
      expect(result[1]).to eq expected2
    end
  end

  describe "#salaries_by_years_of_experience" do
    before do
      user_2017 = create(:user, profile: create(:profile, graduation_year: 2017))
      user_2018 = create(:user, profile: create(:profile, graduation_year: 2018))

      create(:salary, :remote, user: user_2017, start_date: "2017-03-20", end_date: "2018-06-01", amount: 75000)
      create(:salary, :remote, user: user_2017, start_date: "2018-06-20", end_date: nil, current_salary: true, amount: 95000)

      create(:salary, :remote, user: user_2018, start_date: "2018-03-20", end_date: nil, current_salary: true, amount: 85000)
    end

    let(:result) { service.salaries_by_years_of_experience }
    let(:expected1) do
      {
        "years_of_xp" => 1,
        "submission_count" => 1,
        "average_salary" => 95000,
        "minimum_salary" => 95000,
        "maximum_salary" => 95000
      }
    end

    let(:expected2) do
      {
        "years_of_xp" => 0,
        "submission_count" => 2,
        "average_salary" => 80000,
        "minimum_salary" => 75000,
        "maximum_salary" => 85000
      }
    end

    it "returns salaries by years of experience" do
      expect(result.count).to eq 2
      expect(result.first).to eq expected1
      expect(result[1]).to eq expected2
    end
  end
end
