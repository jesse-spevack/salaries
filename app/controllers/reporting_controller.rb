class ReportingController < ApplicationController
  def current_salary_by_graduation_year
    render json: SalaryReportingService.current_salary_by_graduation_year
  end

  def salaries_by_years_of_experience
    records = SalaryReportingService.salaries_by_years_of_experience

    render json: ChartService.new(records).salaries_by_years_of_experience
  end
end
