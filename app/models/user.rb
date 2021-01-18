# frozen_string_literal: true

class User < ApplicationRecord
  validates :slack_id, uniqueness: true

  has_many :salaries, dependent: :destroy
  has_one :profile, dependent: :destroy

  def display_slack_id
    slack_id[0..10] + "..."
  end

  def profile_first_or_initialize
    profile || Profile.new(user: self)
  end
end
