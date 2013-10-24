class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :authentication

  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_page

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_page_set(path)
    @current_page ||= path
  end

  def current_page
    @current_page
  end

  def authentication
    if !current_user && controller_name != "main"
      redirect_to root_url, alert: "Для начала работы, пожалуйста зарегестрируйтесь"
    end
  end

end
