require "rails_helper"

RSpec.describe SalariesComponent, type: :component do
  subject(:salaries_component) { described_class.new(salaries: salaries) }

  let(:salaries) { build_stubbed_list(:salary, 3) }

  it "renders a beautiful list of salaries" do
    expect(render_inline(salaries_component).css("tr").count).to eq salaries.count + 1
  end
end
