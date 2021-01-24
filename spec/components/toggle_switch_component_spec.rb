require "rails_helper"

RSpec.describe ToggleSwitchComponent, type: :component do
  subject(:toggle_switch) { described_class.new(form: form, attribute: :attribute) }

  let(:form) { double }
  let(:result) { render_inline(toggle_switch) }

  before { allow(form).to receive(:check_box).and_return(nil) }

  it "renders a beautiful toggle switch" do
    expect(result.css("span").count).to eq 4
    expect(result.css("button").count).to eq 1
    expect(result.css("div").count).to eq 1
  end
end
