class Payment < ApplicationRecord
  # Associations
  belongs_to :member

  # Enums
  enum :status, { pending: 0, completed: 1, failed: 2, refunded: 3 }
  enum :payment_method, { cash: 0, credit_card: 1, debit_card: 2, bank_transfer: 3, online: 4 }

  # Validations
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :payment_method, presence: true
  validates :payment_date, presence: true
  validates :reference_number, presence: true, uniqueness: true

  # Callbacks
  before_validation :generate_reference_number, on: :create

  # Scopes
  scope :completed, -> { where(status: :completed) }
  scope :pending, -> { where(status: :pending) }
  scope :this_month, -> { where("payment_date >= ?", Date.current.beginning_of_month) }

  # Methods
  def member_name
    member.full_name
  end

  def formatted_amount
    "$#{amount}"
  end

  private

  def generate_reference_number
    return if reference_number.present?

    loop do
      self.reference_number = "PAY#{Time.current.strftime('%Y%m%d')}#{SecureRandom.hex(3).upcase}"
      break unless Payment.exists?(reference_number: reference_number)
    end
  end
end
