class Role < ApplicationRecord
  # Associations
  has_many :users

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  # Scopes
  scope :active, -> { where(active: true) }

  # Methods
  def permissions_list
    permissions&.keys || []
  end

  def has_permission?(permission)
    permissions_list.include?(permission.to_s)
  end
end
