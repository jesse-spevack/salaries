class ReportingController < ApplicationController
  def current_salary_by_graduation_year
    render json: SalaryReportingService.new.current_salary_by_graduation_year
  end

  def salaries_by_years_of_experience
    render json: SalaryReportingService.new.salaries_by_years_of_experience
  end
end
