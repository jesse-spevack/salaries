require "rails_helper"

RSpec.describe SelectComponent, type: :component do
  subject(:select) do
    described_class.new(
      title: "title",
      select_text: select_text,
      collection: collection
    )
  end

  let(:collection) { ["a", "b"] }
  let(:result) { render_inline(select) }
  let(:select_text) { "select_text" }

  it "renders a bautiful select component with the correct number of items" do
    expect(result.css("li").count).to eq collection.count
  end

  context "when select text is nil" do
    let(:select_text) { nil }

    it "renders a beautiful select component with default select text" do
      expect(result.css("button").to_html).to include "Select Title"
    end
  end

  context "when select text is present" do
    it "renders a beautiful select component with default select text" do
      expect(result.css("button").to_html).to include select_text
    end
  end
end
