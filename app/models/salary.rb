class Salary < ApplicationRecord
  MINIMUM_SALARY = 10_000

  belongs_to :user
  belongs_to :location, optional: true

  accepts_nested_attributes_for :location

  validates :amount, presence: true
  validates_numericality_of :amount, only_integer: true, greater_than: MINIMUM_SALARY
  validates :end_date, presence: true, unless: :current_salary
  validate :start_date_in_past
  validate :end_date_after_start_date
  validate :end_date_must_be_blank_if_current_salary

  def location_attributes=(location_attributes)
    self.location = Location.find_or_create_by(location_attributes)
  end

  private

  def start_date_in_past
    errors.add(:start_date, "must not be in the future.") if start_date > Date.today
  end

  def end_date_after_start_date
    return if current_salary
    errors.add(:end_date, "must be after the start date.") if end_date <= start_date
  end

  def end_date_must_be_blank_if_current_salary
    errors.add(:end_date, "must be blank when this is a current salary.") if current_salary && end_date
  end
end
