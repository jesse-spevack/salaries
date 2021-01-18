require "rails_helper"

RSpec.describe "Creating salaries", type: :feature do
  let(:amount) { 80_000 }

  scenario "takes place on user profile page" do
    user = mock_auth_hash

    visit root_path
    click_link "slack-login"

    click_link "New Salary"
    fill_in("Amount", with: amount)
    fill_in("salary_start_date", with: 1.year.ago)
    check("salary_current_salary")
    click_on "Save"

    expect(current_path).to eq profile_path
    expect(page).to have_content("$80,000.00")
    expect(user.salaries.first.amount).to eq amount
  end
end
