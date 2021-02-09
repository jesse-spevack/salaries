class Profile < ApplicationRecord
  VALID_GRADUATION_YEARS = (2013..Date.today.year).to_a

  belongs_to :user
  validates :graduation_year, inclusion: VALID_GRADUATION_YEARS
end
