require "rails_helper"

RSpec.describe FormHeaderComponent, type: :component do
  subject(:form_header) { described_class.new(title: "title", subtitle: "subtitle") }

  let(:expected) { "<div>\n  <h3 class=\"text-lg leading-6 font-medium text-gray-900\">title</h3>\n  <p class=\"mt-1 max-w-2xl text-sm text-gray-500\">subtitle</p>\n</div>" }

  it "renders a beautiful form header" do
    expect(render_inline(form_header).to_html).to eq(expected)
  end
end
