require "rails_helper"

RSpec.describe AlertComponent, type: :component do
  subject(:alert) { described_class.new(header: "header", body: "body") }

  let(:result) { render_inline(alert) }

  it "renders a beautiful alert" do
    expect(result.css("button").count).to eq 2
    expect(result.css("div").count).to eq 10
    expect(result.css("span").count).to eq 1
    expect(result.css("svg").count).to eq 1
    expect(result.css("h3").count).to eq 1
    expect(result.css("p").count).to eq 1
  end
end
