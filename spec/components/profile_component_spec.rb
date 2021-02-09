require "rails_helper"

RSpec.describe ProfileComponent, type: :component do
  subject(:profile) { described_class.new(profile: create(:profile)) }

  let(:result) { render_inline(profile) }

  it "renders a beautiful profile row component" do
    expect(result.css("dt").to_html).to include "Graduation year"
  end
end
