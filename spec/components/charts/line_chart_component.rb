require "rails_helper"

RSpec.describe Charts::LineChartComponent, type: :component do
  subject(:line_chart_component) { described_class.new(data: data) }
  let(:data) { ["test"] }
  let(:result) { render_inline(line_chart_component) }

  it "renders line chart data" do
    expect(result.to_html.include?(data[0])).to be(true)
  end
end
