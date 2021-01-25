require "rails_helper"

RSpec.describe SelectComponent, type: :component do
  subject(:select) do
    described_class.new(
      item: "item",
      item_id: 1,
      attribute: "attribute",
      path: "path",
      collection: collection
    )
  end

  let(:collection) { ["a", "b"] }
  let(:result) { render_inline(select) }

  it "renders a beautiful select component" do
    expect(result.css("button").count).to eq 2
    expect(result.css("li").count).to eq collection.count
  end
end
