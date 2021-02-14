class Charts::LineChartComponent < ViewComponent::Base
  def initialize(data:)
    @data = data
  end
end
