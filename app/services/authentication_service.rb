# We do not want to store the actual slack id in order to
# keep users anonymous. Instead we use SHA256 to create a hashed
# version of the id and store that in the DB. SHA256
# is a one way, deterministic hashing algorithm. It is impossible to
# go from hashed_slack_id back to the original id. It is only possible
# to go from slack_id to hashed_slack_id.
class AuthenticationService
  # @param auth_hash [OmniAuth::AuthHash] the omniauth hash returned in an omniauth request
  # @return [AuthenticationService] an instance of the authentication service
  def initialize(auth_hash)
    slack_id = auth_hash.info.user_id
    @hashed_slack_id = Digest::SHA256.hexdigest(slack_id)
  end

  # @return [User] an instance of a user
  def find_or_create_user
    User.find_or_create_by(slack_id: @hashed_slack_id)
  end
end
