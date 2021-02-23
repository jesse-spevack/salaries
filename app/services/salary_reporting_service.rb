# Responsible for database reporting
class SalaryReportingService
  class << self
    def current_salary_by_graduation_year
      sql = <<-SQL
        SELECT
          profiles.graduation_year AS graduation_year,
          COUNT(salaries.id) AS submission_count,
          CAST(AVG(salaries.amount) AS INTEGER) AS average_salary,
          MIN(salaries.amount) AS minimum_salary,
          MAX(salaries.amount) AS maximum_salary
        FROM
          salaries
          JOIN users ON salaries.user_id = users.id
          JOIN profiles ON users.id = profiles.user_id
        WHERE
          salaries.current_salary = true
        GROUP BY
          graduation_year
        ORDER BY
          graduation_year
      SQL

      ActiveRecord::Base.connection.execute(sql)
    end

    def salaries_by_years_of_experience
      sql = <<-SQL
        SELECT
          CAST(EXTRACT(YEAR FROM salaries.start_date) AS INTEGER) - profiles.graduation_year AS years_of_experience,
          COUNT(salaries.id) AS submission_count,
          CAST(AVG(salaries.amount) AS INTEGER) AS average_salary,
          MIN(salaries.amount) AS minimum_salary,
          MAX(salaries.amount) AS maximum_salary
        FROM
          salaries
          JOIN users ON salaries.user_id = users.id
          JOIN profiles ON users.id = profiles.user_id
        GROUP BY
          years_of_experience 
        ORDER BY
          years_of_experience DESC
      SQL

      ActiveRecord::Base.connection.execute(sql)
    end
  end
end
