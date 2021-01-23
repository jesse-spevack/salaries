require "rails_helper"

RSpec.describe DescriptionTitleComponent, type: :component do
  let(:title) { "My Title" }

  it "renders a descritpion title" do
    expect(render_inline(described_class.new(title: title)).css("dt").to_html).to include(title)
  end
end
