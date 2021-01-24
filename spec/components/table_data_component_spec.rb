require "rails_helper"

RSpec.describe TableDataComponent, type: :component do
  subject(:table_data) { described_class.new(text: "header") }

  let(:expected) { "<td class=\"px-6 py-4 whitespace-nowrap text-sm text-gray-500\">header</td>\n" }

  it "renders a beautiful table data" do
    expect(render_inline(table_data).to_html).to eq(expected)
  end
end
