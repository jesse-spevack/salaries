# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # We never store the actual slack id in our database, only a hashed version.
    # It is impossible to back into the slack id given the hashed id.
    slack_id { Digest::SHA256.hexdigest("12345ABCDEF") }
  end
end
