class Invoice < ApplicationRecord
  # Associations
  belongs_to :member

  # Enums
  enum :status, { draft: 0, sent: 1, paid: 2, overdue: 3, cancelled: 4 }

  # Validations
  validates :total_amount, presence: true, numericality: { greater_than: 0 }
  validates :due_date, presence: true
  validates :invoice_number, presence: true, uniqueness: true

  # Callbacks
  before_validation :generate_invoice_number, on: :create

  # Scopes
  scope :paid, -> { where(status: :paid) }
  scope :overdue, -> { where("due_date < ? AND status != ?", Date.current, :paid) }
  scope :pending, -> { where(status: [ :draft, :sent ]) }

  # Methods
  def member_name
    member.full_name
  end

  def formatted_amount
    "$#{total_amount}"
  end

  def overdue?
    due_date < Date.current && status != "paid"
  end

  def days_overdue
    return 0 unless overdue?
    (Date.current - due_date).to_i
  end

  private

  def generate_invoice_number
    return if invoice_number.present?

    loop do
      self.invoice_number = "INV#{Time.current.strftime('%Y%m')}#{SecureRandom.hex(3).upcase}"
      break unless Invoice.exists?(invoice_number: invoice_number)
    end
  end
end
