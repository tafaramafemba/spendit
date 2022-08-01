class Category < ApplicationRecord
belongs_to :user
has_many :transactions
validates :name, presence: true

# after_destroy :delete_comments_counter
# after_save :update_comments_counter

# def update_categories_counter
#   category.increment!(:comments_counter)
# end

# def delete_categories_counter
#   category.decrement!(:comments_counter)
def recent_categories
  posts.order(created_at: :desc)
end
end
end
