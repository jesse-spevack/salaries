require "rails_helper"

RSpec.describe DescriptionDetailComponent, type: :component do
  subject(:description_detail_component) { described_class.new(controller: "controller", data_target: "target", detail: detail) }

  let(:detail) { "detail" }

  it "renders something useful" do
    expect(
      render_inline(description_detail_component).to_html
    ).to eq("<span class=\"flex-grow\" data-controller-target=\"target\">detail</span>")
  end
end
