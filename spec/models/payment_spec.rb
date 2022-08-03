require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) do
    @file = fixture_file_upload('SpendIt.png', 'image/png')
    @user = User.new(name: 'Tafara', email: 'tafara@gmail.com', id: 1)
    @category = Category.new(name: 'Fast Food', image: @file, user_id: @user.id, id: 1)
    @payment = @category.payments.new(name: 'Apple Pie', amount: 5, user_id: @user.id, category_id: @category.id)
  end

  describe 'validation tests' do
    it 'validates the user_id is present' do
      expect(@category.user_id).to eq(1)
    end

    it 'validates the group_id is present' do
      expect(@payment.category_id).to eq(1)
    end

    it 'validates the record exists' do
      expect(@payment.name).to eq('Apple Pie')
    end
  end
end
