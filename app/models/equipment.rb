class Equipment < ApplicationRecord
  # Associations
  belongs_to :gym

  # Enums
  enum :status, { available: 0, in_use: 1, maintenance: 2, out_of_order: 3 }

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :serial_number, presence: true, uniqueness: true
  validates :purchase_date, presence: true

  # Scopes
  scope :available, -> { where(status: :available) }
  scope :in_maintenance, -> { where(status: :maintenance) }
  scope :out_of_order, -> { where(status: :out_of_order) }

  # Methods
  def age_years
    ((Date.current - purchase_date) / 365.25).to_i
  end

  def maintenance_due?
    maintenance_date.present? && maintenance_date <= Date.current
  end

  def days_since_maintenance
    return nil unless maintenance_date.present?
    (Date.current - maintenance_date).to_i
  end
end
