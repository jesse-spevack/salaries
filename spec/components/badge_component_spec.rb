require "rails_helper"

RSpec.describe BadgeComponent, type: :component do
  subject(:badge) { described_class.new(text: "Yes", color: "green") }

  let(:expected) { "<span class=\"bg-green-100 inline-flex items-center px-2.5 py-0.5 rounded-md text-sm font-medium text-gray-800\">Yes</span>\n" }

  it "renders a beautiful badge" do
    expect(render_inline(badge).to_html).to eq(expected)
  end
end
