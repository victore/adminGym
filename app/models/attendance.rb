class Attendance < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :gym

  # Validations
  validates :check_in, presence: true
  validate :check_out_after_check_in

  # Scopes
  scope :today, -> { where("DATE(check_in) = ?", Date.current) }
  scope :this_week, -> { where("check_in >= ?", Date.current.beginning_of_week) }
  scope :this_month, -> { where("check_in >= ?", Date.current.beginning_of_month) }

  # Methods
  def member_name
    member.full_name
  end

  def duration_minutes
    return nil unless check_out.present?
    ((check_out - check_in) / 60).to_i
  end

  def duration_hours
    return nil unless check_out.present?
    ((check_out - check_in) / 3600).round(2)
  end

  def checked_out?
    check_out.present?
  end

  private

  def check_out_after_check_in
    if check_out.present? && check_in.present? && check_out <= check_in
      errors.add(:check_out, "must be after check in time")
    end
  end
end
