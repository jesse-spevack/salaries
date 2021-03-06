class Salary < ApplicationRecord
  MINIMUM_SALARY = 10_000

  belongs_to :user
  belongs_to :location, optional: true

  accepts_nested_attributes_for :location
  before_save :remove_location, if: proc { will_save_change_to_remote?(to: true) }

  validates_numericality_of :amount, only_integer: true, greater_than: MINIMUM_SALARY
  validates :amount, presence: true
  validates :end_date, presence: true, unless: :current_salary

  validate :start_date_in_past
  validate :end_date_after_start_date
  validate :end_date_must_be_blank_if_current_salary

  # Ensure we do not try to save an invalid location
  # when one or more location attributes are blank.
  def location_attributes=(attributes)
    self.location = if attributes.values.none?(&:blank?)
      Location.find_or_create_by(attributes)
    end
  end

  def city
    location&.name || "Remote"
  end

  def remove_location
    self.location = nil
  end

  private

  def start_date_in_past
    errors.add(:start_date, "must not be in the future.") if start_date > Date.today
  end

  def end_date_after_start_date
    return if current_salary
    errors.add(:end_date, "must be after the start date.") if end_date.present? && end_date <= start_date
  end

  def end_date_must_be_blank_if_current_salary
    errors.add(:end_date, "must be blank when this is a current salary.") if current_salary && end_date
  end
end
