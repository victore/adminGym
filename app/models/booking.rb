class Booking < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :activity

  # Enums
  enum :status, { confirmed: 0, cancelled: 1, completed: 2, no_show: 3 }

  # Validations
  validates :booking_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :booking_date_not_in_past
  validate :activity_has_available_spots
  validate :member_has_active_membership

  # Scopes
  scope :today, -> { where(booking_date: Date.current) }
  scope :upcoming, -> { where("booking_date >= ?", Date.current) }
  scope :confirmed, -> { where(status: :confirmed) }

  # Methods
  def duration_minutes
    ((end_time - start_time) / 60).to_i
  end

  def member_name
    member.full_name
  end

  def activity_name
    activity.name
  end

  private

  def booking_date_not_in_past
    if booking_date.present? && booking_date < Date.current
      errors.add(:booking_date, "can't be in the past")
    end
  end

  def activity_has_available_spots
    if activity.present? && activity.fully_booked?
      errors.add(:activity, "is fully booked")
    end
  end

  def member_has_active_membership
    if member.present? && member.membership_expired?
      errors.add(:member, "membership has expired")
    end
  end
end
