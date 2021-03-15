require "rails_helper"

describe ChartService do
  subject(:chart_service) { ChartService.new(records) }

  describe "#salaries_by_years_of_experience" do
    before do
      user_2017 = create(:user, profile: create(:profile, graduation_year: 2017))
      user_2018 = create(:user, profile: create(:profile, graduation_year: 2018))

      # 0 years of experience
      create(:salary, :remote, user: user_2017, start_date: "2017-03-20", end_date: "2018-06-01", amount: 75000)

      # 1 year of experience
      create(:salary, :remote, user: user_2017, start_date: "2018-06-20", end_date: nil, current_salary: true, amount: 85000)
      create(:salary, :remote, user: user_2018, start_date: "2019-06-20", end_date: nil, current_salary: true, amount: 95000)

      # 2 years of experience
      create(:salary, :remote, user: user_2017, start_date: "2019-03-20", end_date: nil, current_salary: true, amount: 130000)
      create(:salary, :remote, user: user_2018, start_date: "2020-03-20", end_date: nil, current_salary: true, amount: 100000)
    end

    let(:records) { SalaryReportingService.salaries_by_years_of_experience }

    it "returns formatted salaries by years of experience" do
      expected = [
        {
          name: "Max salary",
          data: [
            [2, 130000],
            [1, 95000],
            [0, 75000]
          ]
        },
        {
          name: "Average salary",
          data: [
            [2, 115000],
            [1, 90000],
            [0, 75000]
          ]
        },
        {
          name: "Min salary",
          data: [
            [2, 100000],
            [1, 85000],
            [0, 75000]
          ]
        }
      ]
      expect(chart_service.salaries_by_years_of_experience).to eq(expected)
    end
  end
end
