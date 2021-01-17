require "rails_helper"

RSpec.describe "Creating profile", type: :system do
  before { driven_by(:selenium_chrome_headless) }

  scenario "takes place on user profile page" do
    user = mock_auth_hash

    visit root_path
    click_link "slack-login"
    click_on("Select Graduation Year")
    page.find("li", text: "2017").click

    expect(current_path).to eq profile_path
    expect(page).to have_content("2017")
    expect(user.profile.graduation_year).to eq 2017
  end
end
