module OmniauthHelper
  def mock_auth_hash
    slack_id = "raw_slack_id_12345"
    hashed_id = Digest::SHA256.hexdigest(slack_id)
    user = User.create(slack_id: hashed_id)
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:slack] = OmniAuth::AuthHash.new(
      info: {
        user_id: slack_id
      }
    )
    user
  end
end
