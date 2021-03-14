require "rails_helper"
RSpec.describe "Viewing /data content" do
  before { driven_by(:selenium_chrome_headless) }
  context "with authentication" do
    before do
      mock_auth_hash
      visit root_path
      click_link "slack-login"
    end
    context "clicking on the Data link" do
      it "displays a line chart" do
        click_link "Data"

        expect(page).to have_css("#salary-line-chart")
      end
    end
  end
  context "without authentication" do
    it "redirects to welcome page" do
      visit data_path
      expect(current_path).to eq root_path
    end
  end
end
