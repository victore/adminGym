class MembershipHistory < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :membership_plan

  # Enums
  enum :status, { active: 0, expired: 1, cancelled: 2, suspended: 3 }

  # Validations
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :payment_amount, presence: true, numericality: { greater_than: 0 }
  validate :end_date_after_start_date

  # Scopes
  scope :active, -> { where(status: :active) }
  scope :expired, -> { where(status: :expired) }
  scope :current, -> { where("start_date <= ? AND end_date >= ?", Date.current, Date.current) }

  # Methods
  def member_name
    member.full_name
  end

  def plan_name
    membership_plan.name
  end

  def duration_days
    (end_date - start_date).to_i
  end

  def duration_months
    ((end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month)).to_i
  end

  def expired?
    end_date < Date.current
  end

  def active?
    start_date <= Date.current && end_date >= Date.current
  end

  private

  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date <= start_date
      errors.add(:end_date, "must be after start date")
    end
  end
end
