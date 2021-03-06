require "rails_helper"

RSpec.describe "Editing salaries", type: :system do
  before { driven_by(:selenium_chrome_headless) }

  describe "Editing salary" do
    let(:amount) { 80_000 }
    let(:remote_xpath) { "/html/body/div[2]/form/div[1]/div[3]/div[1]/div/button" }

    scenario "switching non remote to remote" do
      user = mock_auth_hash
      salary = create(:salary, user: user)

      visit root_path
      click_link "slack-login"

      click_link "Edit"
      find(:xpath, remote_xpath).click
      click_on "Save"

      expect(current_path).to eq profile_path
      expect(salary.reload.remote?).to eq true
    end

    scenario "switching remote to non remote" do
      user = mock_auth_hash
      create(:salary, :remote, user: user)

      visit root_path
      click_link "slack-login"

      click_link "Edit"
      find(:xpath, remote_xpath).click
      location_field = find("#salary_location_attributes_name")

      expect(location_field.value).to eq ""
    end

    scenario "editing remote salary" do
      user = mock_auth_hash
      salary = create(:salary, :remote, user: user)
      new_amount = salary.amount + 900

      visit root_path
      click_link "slack-login"

      click_link "Edit"
      fill_in("Amount", with: new_amount)
      click_on "Save"

      expect(current_path).to eq profile_path
      expect(salary.reload.amount).to eq new_amount
    end
  end
end
