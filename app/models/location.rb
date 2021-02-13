# frozen_string_literals: true

class Location < ApplicationRecord
  has_many :salaries

  validates :place_id, presence: true
  validates :name, presence: true
end
