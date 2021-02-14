require "rails_helper"

RSpec.describe "Creating salaries", type: :system do
  before { driven_by(:selenium_chrome_headless) }

  describe "creating new salary" do
    let(:amount) { 80_000 }
    let(:start_date_xpath) { "//*[@id='salary_start_date']" }
    let(:back_a_month_xpath) { "/html/body/div[3]/div[1]/span[1]" }
    let(:first_day_of_month_xpath) { "/html/body/div[3]/div[2]/div/div[2]/div/span[1]" }
    let(:current_salary_xpath) { "/html/body/div[2]/form/div[1]/div[5]/div[1]/div/button" }
    let(:remote_xpath) { "/html/body/div[2]/form/div[1]/div[3]/div[1]/div/button" }

    scenario "with current = true and remote = false" do
      user = mock_auth_hash

      visit root_path
      click_link "slack-login"

      click_link "New Salary"
      fill_in("Amount", with: amount)
      fill_in("salary_location_attributes_name", with: "Den")
      find("li", text: "TEST - Denver, CO, USA - TEST").click
      find(:xpath, start_date_xpath).click
      find(:xpath, back_a_month_xpath).click
      find(:xpath, first_day_of_month_xpath).click
      find(:xpath, current_salary_xpath).click
      click_on "Save"

      expect(current_path).to eq profile_path
      expect(page).to have_content("$80,000.00")
      expect(user.salaries.first.amount).to eq amount
    end

    scenario "with current = true and remote = true" do
      user = mock_auth_hash

      visit root_path
      click_link "slack-login"

      click_link "New Salary"
      fill_in("Amount", with: amount)
      find(:xpath, remote_xpath).click
      find(:xpath, start_date_xpath).click
      find(:xpath, back_a_month_xpath).click
      find(:xpath, first_day_of_month_xpath).click
      find(:xpath, current_salary_xpath).click
      click_on "Save"

      expect(current_path).to eq profile_path
      expect(page).to have_content("$80,000.00")
      expect(user.salaries.first.amount).to eq amount
    end
  end
end
