require "rails_helper"

RSpec.describe Charts::LineChartComponent, type: :component do
  subject(:line_chart_component) { described_class.new }
  let(:result) { render_inline(line_chart_component) }

  it "renders line chart data" do
    expect(result.css("#salary-line-chart").count).to eq(1)
  end
end
