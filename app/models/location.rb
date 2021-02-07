# frozen_string_literals: true

class Location < ApplicationRecord
  REMOTE_ATTRIBUTES = {name: "Remote", place_id: "Remote"}

  has_many :salaries

  validates :place_id, presence: true
  validates :name, presence: true

  def self.from_attributes(attributes)
    if attributes.values.all?(&:blank?)
      attributes.merge!(REMOTE_ATTRIBUTES)
    end

    find_or_create_by(attributes)
  end
end
