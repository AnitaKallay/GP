class Api::V1::UsersController < ApplicationController
before_action :authenticate, except: [:create, :confirm, :update]

  def create
   @user = User.new(user_params)
     if @user.save
       render json: {user: @user, message: "Please confirm your email address to continue"}
     else
       render json: {errors: @user.errors.full_messages}
     end
  end

  def confirm
   @user = User.find_by(confirm_token:params[:token])
    if @user.present?
      @user.update_column(:email_confirmed,true)
       render json: {message: "Welcome to the Sample App! Your email has been confirmed.Please log in to continue"}
     else
       render json: {message: @user.errors.full_messages}
     end
   end

  def login
   @user = User.find_by(email: params[:email])
     if @user.authenticate(params[:password])
       if @user.email_confirmed
          @token = Token.create(user_id: @user.id)
          render json: {token: @token, messages: "Successfully", user: @user}
        else
          render json: {messages: "Your email is not confirmed"}
        end
      else
        render json: {messages: "Your email or password is not correct"}
      end
   end

   def logout
      if @current_user_token.destroy
         render json: {messages: "You have successfully logged out"}
      else
        render json: {error_message: @user.errors.full_messages}
      end
   end

   def update
     @user = User.find_by(id: params[:id])
      if @user.update(user_params)
         render json: { messages: "Your profile has been updated successfully" }
      else
         render json: {error_message: @user.errors.full_messages}
      end
   end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,:password_confirmation, :avatar, :role, :IMC, :gp_type, :practice_name, :country, :county, :user_types)
  end
end
