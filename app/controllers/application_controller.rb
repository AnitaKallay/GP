class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def authenticate
    @token = Token.find_by(auth_token: request.headers['Authorization'])
     if @token.present?
       @current_user = @token.user
       @current_user_token = @token
     else
       render json: {error_message: "Unauthorized"}
     end
   end

   def current_user
     @current_user
   end
end
