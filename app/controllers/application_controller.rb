class ApplicationController < ActionController::Base
include Pundit
skip_before_action :verify_authenticity_token
rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def render_unauthorized(message)
  errors = { errors: [ { detail: message } ] }
    render json: errors, status: :unauthorized
  end

  def current_user
   @current_user
  end

  def authenticate
      @current_user = User.find_by(auth_token: request.headers['Authorization'])
  end
private
  def user_not_authorized
     render json: {error_message: "You are not authorized to perform this action"}
  end
end
