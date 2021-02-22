class Profile < ApplicationRecord
  VALID_GRADUATION_YEARS = (2013..Date.today.year).to_a
  VALID_PROGRAMS = ["Front-End", "Back-End", "Fullstack"]

  belongs_to :user
  validates :graduation_year, inclusion: VALID_GRADUATION_YEARS
  validates :program, inclusion: VALID_PROGRAMS
end
