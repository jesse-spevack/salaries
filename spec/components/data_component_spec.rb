require "rails_helper"

RSpec.describe DataComponent, type: :component do
  subject(:data_component) { described_class.new }
  let(:result) { render_inline(data_component) }

  it "renders a line chart" do
    expect(result.css("#reporting-salaries-by-years-of-experience").count).to eq(1)
  end
end
