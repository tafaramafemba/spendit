class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show; end

  def destroy
    signed_out?(Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    redirect_to root_path
  end
end
