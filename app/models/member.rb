class Member < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :membership_plan
  belongs_to :gym
  has_many :membership_histories, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :invoices, dependent: :destroy

  # Enums
  enum :status, { active: 0, inactive: 1, suspended: 2, expired: 3 }

  # Validations
  validates :membership_number, presence: true, uniqueness: true
  validates :join_date, presence: true
  validates :expiry_date, presence: true
  validates :emergency_contact, presence: true
  validates :emergency_phone, presence: true

  # Callbacks
  before_validation :generate_membership_number, on: :create
  before_validation :set_expiry_date, on: :create

  # Scopes
  scope :active, -> { where(status: :active) }
  scope :expired, -> { where("expiry_date < ?", Date.current) }

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

  def membership_expired?
    expiry_date < Date.current
  end

  def days_until_expiry
    (expiry_date - Date.current).to_i
  end

  private

  def generate_membership_number
    return if membership_number.present?

    loop do
      self.membership_number = "MEM#{Time.current.strftime('%Y%m')}#{SecureRandom.hex(3).upcase}"
      break unless Member.exists?(membership_number: membership_number)
    end
  end

  def set_expiry_date
    return if expiry_date.present?

    self.expiry_date = join_date + membership_plan.duration_months.months
  end
end
