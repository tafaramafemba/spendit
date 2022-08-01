class Category < ApplicationRecord
has_one_attached :image
belongs_to :user
has_many :payments, dependent: :delete_all
validates :name, presence: true

# after_destroy :delete_comments_counter
# after_save :update_comments_counter

# def update_categories_counter
#   category.increment!(:comments_counter)
# end

# def delete_categories_counter
#   category.decrement!(:comments_counter)
def payment_total
  payments.sum(:amount)
end
end
