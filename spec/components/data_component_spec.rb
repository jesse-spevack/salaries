require "rails_helper"

RSpec.describe DataComponent, type: :component do
  subject(:data_component) { described_class.new(data: data) }
  let(:data) { ["test"] }
  let(:result) { render_inline(data_component) }

  it "renders line chart data" do
    expect(result.to_html.include?(data[0])).to be(true)
  end
end
