require "rails_helper"

RSpec.describe SelectListItemComponent, type: :component do
  subject(:select_list_item) { described_class.new(selected: selected, value: value) }

  let(:selected) { "selected" }
  let(:value) { "value" }

  it "renders a beautiful select list item" do
    result = render_inline(select_list_item)
    expect(result.css(:div).count).to eq 1
    expect(result.css(:span).count).to eq 2
    expect(result.css(:li).count).to eq 1
  end
end
