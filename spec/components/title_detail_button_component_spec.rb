require "rails_helper"

RSpec.describe TitleDetailButtonComponent, type: :component do
  subject(:title_detail_button) do
    described_class.new(
      button_text: button_text,
      button_action: "action",
      controller: "controller",
      detail_target: detail,
      profile: profile,
      target: "target",
      title: title
    )
  end

  let(:profile) { build(:profile) }
  let(:title) { "A great title" }
  let(:detail) { "Some interesting details" }
  let(:button_text) { "A call to action" }
  let(:result) { render_inline(title_detail_button) }

  it "renders a title detail button component that looks amazing" do
    expect(result.css("dt").to_html).to include(title)
    expect(result.css("dd").to_html).to include(detail)
    expect(result.css("button").to_html).to include(button_text)
  end
end
