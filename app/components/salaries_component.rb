# frozen_string_literal: true

class SalariesComponent < ViewComponent::Base
  def initialize(salaries:)
    @salaries = salaries
  end
end
