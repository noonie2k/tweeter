module UsersHelper
  public
    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end
end
