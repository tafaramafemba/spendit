class Category < ApplicationRecord
has_one_attached :image
belongs_to :user
has_many :payments, dependent: :delete_all
validates :name, presence: true

def total_payments
  payments.size
end

def payment_total
  payments.sum(:amount)
end
end
