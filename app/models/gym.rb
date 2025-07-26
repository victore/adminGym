class Gym < ApplicationRecord
  # Associations
  has_many :members, dependent: :destroy
  has_many :staff, dependent: :destroy
  has_many :equipment, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :attendances, dependent: :destroy

  # Enums
  enum :status, { active: 0, inactive: 1, maintenance: 2 }

  # Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Scopes
  scope :active, -> { where(status: :active) }

  # Methods
  def member_count
    members.active.count
  end

  def staff_count
    staff.active.count
  end
end
