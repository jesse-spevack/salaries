require "rails_helper"

RSpec.describe "Creating salaries", type: :feature do
  let(:amount) { 80_000 }

  scenario "takes place on user profile page" do
    user = mock_auth_hash

    visit root_path
    click_link "slack-login"

    click_link "New Salary"
    fill_in("Amount", with: amount)
    fill_in("salary_location_attributes_name", with: "Denver, CO, USA")
    find("#place_id", visible: false).set("1234abcd")
    fill_in("salary_start_date", with: 1.year.ago)
    check("salary_current_salary")
    click_on "Save"

    expect(current_path).to eq profile_path
    expect(page).to have_content("$80,000.00")
    expect(user.salaries.first.amount).to eq amount
  end

  scenario "when no location is provided" do
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

  scenario "when location is changed to remote" do
    user = mock_auth_hash
    location = create(:remote_location)
    create(:salary, user: user, location: location)

    visit root_path
    click_link "slack-login"

    click_link "Edit"
    find("#salary_location_attributes_name").set("")
    click_on "Save"

    expect(current_path).to eq profile_path
    expect(page).to have_content("$80,000.00")
    expect(location.name).to eq "remote"
  end
end
