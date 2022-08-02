class Payment < ApplicationRecord
validates :name, presence: true
validates :amount, numericality: { only_integer: false, greated_than_or_equal_to: 0 }

has_many :categories, through: :payments
belongs_to :user
belongs_to :category
end
