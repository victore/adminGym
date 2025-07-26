class Activity < ApplicationRecord
  # Associations
  belongs_to :gym
  has_many :bookings, dependent: :destroy

  # Enums
  enum :status, { active: 0, inactive: 1, cancelled: 2 }

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true

  # Scopes
  scope :active, -> { where(status: :active) }

  # Methods
  def current_bookings_count
    bookings.where(booking_date: Date.current).count
  end

  def available_spots
    capacity - current_bookings_count
  end

  def fully_booked?
    available_spots <= 0
  end
end
