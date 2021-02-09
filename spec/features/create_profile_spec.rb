require "rails_helper"

RSpec.describe "CRUD profile", type: :system do
  before { driven_by(:selenium_chrome_headless) }

  scenario "create takes place on user profile page" do
    user = mock_auth_hash
    future_year = (Date.today.year + 1).to_s

    visit root_path
    click_link "slack-login"
    click_on("Select Graduation year")
    expect(page).to_not have_content(future_year)
    page.find("li", text: "2017").click

    expect(current_path).to eq profile_path
    expect(page).to have_content("2017")
    expect(user.profile.graduation_year).to eq 2017
  end

  scenario "update takes place on user profile page" do
    user = mock_auth_hash
    profile = create(:profile, user: user)

    visit root_path
    click_link "slack-login"
    click_on("Update")
    click_on("2017")
    page.find("li", text: "2020").click

    expect(current_path).to eq profile_path
    expect(page).to have_content("2020")
    expect(profile.reload.graduation_year).to eq 2020
  end
end
