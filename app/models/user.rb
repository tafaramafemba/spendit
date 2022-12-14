class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :categories
  has_many :payments
  validates :name, presence: true

  def admin?(requested_role)
    role == requested_role.to_s
  end
end
