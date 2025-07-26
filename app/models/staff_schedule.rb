class StaffSchedule < ApplicationRecord
  # Associations
  belongs_to :staff
  belongs_to :gym

  # Enums
  enum :day_of_week, {
    sunday: 0, monday: 1, tuesday: 2, wednesday: 3,
    thursday: 4, friday: 5, saturday: 6
  }

  # Validations
  validates :day_of_week, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validate :unique_staff_schedule_per_day

  # Scopes
  scope :for_day, ->(day) { where(day_of_week: day) }
  scope :current_week, -> { where(day_of_week: Date.current.wday) }

  # Methods
  def staff_name
    staff.full_name
  end

  def duration_hours
    ((end_time - start_time) / 3600).round(2)
  end

  def formatted_time_range
    "#{start_time.strftime('%H:%M')} - #{end_time.strftime('%H:%M')}"
  end

  private

  def end_time_after_start_time
    if start_time.present? && end_time.present? && end_time <= start_time
      errors.add(:end_time, "must be after start time")
    end
  end

  def unique_staff_schedule_per_day
    existing_schedule = StaffSchedule.where(
      staff: staff,
      day_of_week: day_of_week
    ).where.not(id: id)

    if existing_schedule.exists?
      errors.add(:day_of_week, "schedule already exists for this day")
    end
  end
end
