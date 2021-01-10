# frozen_string_literal: true

class User < ApplicationRecord
  validates :slack_id, uniqueness: true

  has_many :salaries
  has_one :profile

  def display_slack_id
    slack_id[0..10] + "..."
  end
end
