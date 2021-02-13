require "rails_helper"

RSpec.describe SearchListComponent, type: :component do
  subject(:search_list_component) { described_class.new(form: form, item: item, title: title, collection: collection) }

  let(:collection) { [] }
  let(:form) { double() }
  let(:item) { Location.new }
  let(:title) { "my title" }

  before do
    allow(form).to receive(:text_field)
    allow(form).to receive(:hidden_field)
  end

  it "renders a beautiful search list component" do
    expect(render_inline(search_list_component).css(:ul).count).to eq 1
  end
end
