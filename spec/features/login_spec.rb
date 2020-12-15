require "rails_helper"

RSpec.describe "Logging in with slack", type: :feature do
  let(:user) { build(:user) }

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:slack] = OmniAuth::AuthHash.new(
      info: {
        user_id: user.slack_id
      }
    )
  end

  scenario "shows logout link" do
    visit root_path
    click_link
    expect(page).to have_content(user.slack_id)
    expect(page).to have_link("Logout")
    expect(current_path).to eq profile_path
  end
end
