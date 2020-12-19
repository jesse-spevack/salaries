class Salary < ApplicationRecord
  MINIMUM_SALARY = 10_000

  belongs_to :user

  validates :amount, presence: true
  validates_numericality_of :amount, only_integer: true, greater_than: MINIMUM_SALARY
  validates :end_date, presence: true, unless: :current_salary
  validate :start_date_in_past
  validate :end_date_after_start_date

  private

  def start_date_in_past
    errors.add(:start_date, "must not be in the future.") if start_date > Date.today
  end

  def end_date_after_start_date
    errors.add(:end_date, "must be after the start date.") if end_date <= start_date
  end
end
