require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before(:example) do
    @user = User.new(name: 'Thomas', email: 'thomas@thomas.com', password: 'emilythinksimcool',
                     password_confirmation: 'emilythinksimcool', id: 1)
    @user.skip_confirmation!
    @user.save!
    sign_in @user
  end

  describe 'GET /index' do
    it 'should be successful' do
      get user_categories_path(@user.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
