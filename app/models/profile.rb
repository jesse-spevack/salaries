class Profile < ApplicationRecord
  VALID_GRADUATION_YEARS = (2013..2030).to_a

  belongs_to :user
  validates :graduation_year, inclusion: VALID_GRADUATION_YEARS

end
