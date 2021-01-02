# frozen_string_literal: true

class User < ApplicationRecord
  validates :slack_id, uniqueness: true

  has_many :salaries
end
