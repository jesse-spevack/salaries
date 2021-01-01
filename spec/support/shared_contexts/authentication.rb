RSpec.shared_context :authentication do
  let(:slack_id) { "raw_slack_id_12345" }
  let(:hashed_id) { Digest::SHA256.hexdigest(slack_id) }
  let!(:user) { create(:user, slack_id: hashed_id) }

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:slack] = OmniAuth::AuthHash.new(
      info: {
        user_id: slack_id
      }
    )

    visit root_path
    click_link "slack-login"
  end
end
