class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include AuthenticationHelper
  before_filter :authorize

  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_path, :notice => 'Please log in'
      end
    end
end
