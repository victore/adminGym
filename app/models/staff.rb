class Staff < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :gym
  has_many :staff_schedules, dependent: :destroy

  # Enums
  enum :status, { active: 0, inactive: 1, terminated: 2 }

  # Validations
  validates :position, presence: true
  validates :hire_date, presence: true
  validates :salary, presence: true, numericality: { greater_than: 0 }

  # Scopes
  scope :active, -> { where(status: :active) }

  # Methods
  def full_name
    user.full_name
  end

  def email
    user.email
  end

  def phone
    user.phone
  end

  def years_of_service
    ((Date.current - hire_date) / 365.25).to_i
  end
end
