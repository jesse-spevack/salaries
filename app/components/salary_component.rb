# frozen_string_literal: true

class SalaryComponent < ViewComponent::Base
  def initialize(salary:)
    @salary = salary
  end
end
