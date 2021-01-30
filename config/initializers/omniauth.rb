# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :slack,
    Rails.application.credentials[:turing_slack_client_id],
    Rails.application.credentials[:turing_slack_client_secret],
    scope: "users:read",
    team: Rails.application.credentials[:turing_slack_team_id]
  )
end
