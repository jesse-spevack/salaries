# frozen_string_literals: true

class Location < ApplicationRecord
  has_many :salaries

  validates :place_id, presence: {message: "city must be chosen from drop down"}
  validates :name, presence: {message: "city must be present"}
end
