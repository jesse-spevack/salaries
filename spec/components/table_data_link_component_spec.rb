require "rails_helper"

RSpec.describe TableDataLinkComponent, type: :component do
  subject(:table_data_link) { described_class.new(text: "header", path: "/root") }

  let(:expected) { "<td class=\"px-6 py-4 whitespace-nowrap text-right text-sm font-medium\">\n  <a class=\"text-indigo-600 hover:text-indigo-900\" href=\"/root\">header</a>\n</td>" }

  it "renders a beautiful table data link" do
    expect(render_inline(table_data_link).to_html).to eq(expected)
  end
end
