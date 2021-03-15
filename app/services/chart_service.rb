# Responsible for formatting data so that it can be crafted into charts
class ChartService
  def initialize(records)
    @averages = []
    @maxes = []
    @mins = []
    @records = records
  end

  def salaries_by_years_of_experience
    extract_aggregate_salary_data

    [
      {name: "Max salary", data: maxes},
      {name: "Average salary", data: averages},
      {name: "Min salary", data: mins}
    ]
  end

  private

  attr_reader :averages, :maxes, :mins, :records

  def extract_aggregate_salary_data
    records.each do |record|
      averages << [record["years_of_experience"], record["average_salary"]]
      maxes << [record["years_of_experience"], record["maximum_salary"]]
      mins << [record["years_of_experience"], record["minimum_salary"]]
    end
  end
end
