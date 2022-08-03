require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @file = fixture_file_upload('SpendIt.png', 'image/png')
    @user = User.new(name: 'Tafara', email: 'tafara@gmail.com')
    @category = Category.new(name: 'Fast Food', image: @file, user_id: @user.id)
    @category.payments.new(name: 'Apple Pie', amount: 5, user_id: @user.id, user_id: @category.id)
  end

  describe 'category validation tests' do
    it 'validate the presence of the name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'validate the presence of the image' do
      @category.image = nil
      expect(@category).to_not be_valid
    end

    it 'validate the presence of the user_id' do
      @category.user_id = nil
      expect(@category).to_not be_valid
    end
  end

  describe 'category model methods tests' do
    it 'returns all paymens for the group' do
      expect(@category.total_payments).to eq(1)
    end
  end
end
