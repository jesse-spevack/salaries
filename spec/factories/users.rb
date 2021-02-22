# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # We never store the actual slack id in our database, only a hashed version.
    # It is impossible to back into the slack id given the hashed id.
    sequence(:slack_id) { |i| Digest::SHA256.hexdigest("#{1000 + i}ABCDEF") }
  end
end
