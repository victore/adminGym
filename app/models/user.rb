class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_one :member, dependent: :destroy
  has_one :staff, dependent: :destroy

  # Enums
  enum :status, { active: 0, inactive: 1, suspended: 2 }
  enum :role, { member: 0, staff: 1, manager: 2, admin: 3 }

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :role, presence: true

  # Methods
  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == "admin"
  end

  def staff?
    role == "staff" || role == "manager" || role == "admin"
  end
end
