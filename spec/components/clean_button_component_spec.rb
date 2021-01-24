require "rails_helper"

RSpec.describe CleanButtonComponent, type: :component do
  subject(:clean_button) { described_class.new(action: "action", text: "text") }

  let(:expected) { "<button class=\"bg-white rounded-md font-medium text-indigo-600 hover:text-indigo-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500\" data-action=\"action\" type=\"button\">text</button>\n" }

  it "renders a beautiful clean button" do
    expect(render_inline(clean_button).to_html).to eq expected
  end
end
