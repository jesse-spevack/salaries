require "rails_helper"

RSpec.describe "Creating salaries", type: :feature do
  include_context :authentication

  scenario "takes place on user profile page" do
    visit profile_path(user)
    click_link "Add Salary"
    fill_in("Amount", with: 80_000)
    fill_in("salary_start_date", with: 1.year.ago)
    check("Current Salary")
    click_on "Save"

    expect(current_path).to eq profile_path
    expect(page).to have_content("$80,000.00")
  end
end
