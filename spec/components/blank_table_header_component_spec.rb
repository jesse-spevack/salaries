require "rails_helper"

RSpec.describe BlankTableHeaderComponent, type: :component do
  subject(:blank_table_header) { described_class.new(text: "header") }

  let(:expected) { "<th scope=\"col\" class=\"relative px-6 py-3\">\n  <span class=\"sr-only\">header</span>\n</th>" }

  it "renders a beautiful table header datum" do
    expect(render_inline(blank_table_header).to_html).to eq(expected)
  end
end
