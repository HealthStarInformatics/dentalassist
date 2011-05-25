class ApplicationController < ActionController::Base
  #test
  protect_from_forgery
  filter_parameter_logging :password, :password_confirmation
  
  helper_method :current_user, :current_user_session, :location_admin?, :normal_user?, :super_admin?, :require_user, 
  :require_loc_admin, :require_super_admin
  
  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  def normal_user?
    return true if current_user && current_user.administrator.blank?
  end
  def location_admin?
    return true if current_user && current_user.administrator.eql?("location_admin")
  end
  def super_admin?
    return true if current_user && current_user.administrator.eql?("super_admin")
  end
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
    return true
  end

  def require_loc_admin
    unless location_admin?
      store_location
      flash[:notice] = "You must be logged in as location admin to access this page"
      redirect_to new_user_session_url
      return false
    end
    return true
  end
  def require_super_admin
    unless super_admin?
      store_location
      flash[:notice] = "You must be logged in as admin to access this page"
      redirect_to new_user_session_url
      return false
    end
    return true
  end
  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end
      def store_location
      session[:return_to] = request.request_uri
    end
end
