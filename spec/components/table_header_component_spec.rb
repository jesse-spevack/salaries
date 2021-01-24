require "rails_helper"

RSpec.describe TableHeaderComponent, type: :component do
  subject(:table_header) { described_class.new(text: "header") }

  let(:expected) { "<th scope=\"col\" class=\"px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider\">header</th>\n" }

  it "renders a beautiful table header" do
    expect(render_inline(table_header).to_html).to eq(expected)
  end
end
