# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :slack,
    Figaro.env.turing_slack_client_id,
    Figaro.env.turing_slack_client_secret,
    scope: 'users:read',
    team: Figaro.env.turing_slack_team_id
  )
end
