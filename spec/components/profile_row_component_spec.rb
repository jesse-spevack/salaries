require "rails_helper"

RSpec.describe ProfileRowComponent, type: :component do
  subject(:profile_row) do
    described_class.new(
      item: "item",
      item_id: 1,
      attribute: "attribute",
      path: "path",
      collection: collection
    )
  end

  let(:collection) { ["a", "b"] }
  let(:result) { render_inline(profile_row) }

  it "renders a beautiful profile row component" do
    expect(result.css("button").count).to eq 3
  end
end
