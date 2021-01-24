require "rails_helper"

RSpec.describe TableBoldDataComponent, type: :component do
  subject(:table_bold_data) { described_class.new(text: "header") }

  let(:expected) { "<td class=\"px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900\">header</td>\n" }

  it "renders a beautiful bold table data" do
    expect(render_inline(table_bold_data).to_html).to eq(expected)
  end
end
