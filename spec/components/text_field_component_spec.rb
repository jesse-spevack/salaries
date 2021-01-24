require "rails_helper"

RSpec.describe TextFieldComponent, type: :component do
  subject(:text_field) { described_class.new(form: form, attribute: :attribute) } 

  let(:form) { double }
  let(:result) { render_inline(text_field) }

  before { allow(form).to receive(:text_field) }
  before { allow(form).to receive(:label) }

  it "renders a beautiful text field component" do
    expect(result.css("div").count).to eq 3
  end
end
