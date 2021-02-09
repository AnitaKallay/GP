class Api::V1::PasswordsController < ApplicationController
before_action :authenticate, only: [:update]
   def update
     if @current_user.update(password_params)
       render json: {messages: "You change your password"}
     else
       render json: {error_message: "Password is not corect"}
     end
   end

   def forgot
      @user = User.find_by(email: params[:email])
       if @user.present?
         UserMailer.forgot(@user).deliver_now
          render json: {messages: "To reset your password click the URL "}, status: :ok
       else
          render json: {error_message: "Email is not found"}, status: :not_found
       end
    end

    def reset
      @user = User.find_by(reset_password_token: params[:token])
      if @user.present?
        if @user.update(password_params)
          @user.regenerate_reset_password_token
          render json: {message: "You must log in to the site with email address and new password"}
      else
          render json: {error_message: @user.errors.full_messages }
      end
         else
          render json: {message: "user not found"}
         end
     end

  private

    def password_params
      params.permit(:password, :password_confirmation)
    end
end
