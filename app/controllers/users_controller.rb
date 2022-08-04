class UsersController < Devise::ApplicationController
  def index
    @users = User.all
  end

  def show; end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    redirect_to root_path
  end
end
