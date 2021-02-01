class UsersController < ApplicationController
skip_before_action :verify_authenticity_token


  def create
    @user = User.new(user_params)
    if @user.save
      render json: {user: @user}
    else
      render json: {errors: @user.errors.full_messages}
    end
  end









  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar, :role, :IMC, :gp_type, :practice_name, :country, :county)
  end
end
