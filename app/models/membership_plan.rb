class MembershipPlan < ApplicationRecord
  # Associations
  has_many :members, dependent: :destroy
  has_many :membership_histories, dependent: :destroy

  # Enums
  enum :status, { active: 0, inactive: 1, discontinued: 2 }

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :duration_months, presence: true, numericality: { greater_than: 0 }

  # Scopes
  scope :active, -> { where(status: :active) }

  # Methods
  def features_list
    features&.split(",") || []
  end

  def monthly_price
    price / duration_months
  end
end
