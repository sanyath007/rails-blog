class ApplicationController < ActionController::Base
  layout "application"

  skip_before_action :verify_authenticity_token
  
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else 
      @current_user = nil
    end
  end
end
