require "rails_helper"

RSpec.describe SalaryComponent, type: :component do
  subject(:salary_component) { described_class.new(salary: salary) }

  let(:salary) { build_stubbed(:salary) }

  it "renders a beautiful salary component" do
    expect(render_inline(salary_component).css("td").to_html).to include("$80,000")
  end
end
