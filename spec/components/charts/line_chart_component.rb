require "rails_helper"

RSpec.describe Charts::LineChartComponent, type: :component do
  let(:path) { "/reporting/salaries_by_years_of_experience" }

  context "using default options" do
    subject(:line_chart_component) { described_class.new(path) }
    let(:result) { render_inline(line_chart_component) }

    it "renders line chart data" do
      expect(result.css("#reporting-salaries-by-years-of-experience").count).to eq(1)
    end
  end

  context "using default + specialized_options" do
    subject(:line_chart_component) { described_class.new(path, specialized_options) }
    let(:result) { render_inline(line_chart_component) }
    let(:specialized_options) do
      {
        colors: ["#4F46E5", "#14B8A6", "#C026D3"],
        prefix: "$",
        xtitle: "Years of Experience",
        ytitle: "Salary in Dollars"
      }
    end

    it "renders line chart data" do
      expect(result.css("#reporting-salaries-by-years-of-experience").count).to eq(1)
    end
  end
end
