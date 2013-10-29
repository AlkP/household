class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  $global_date ||= Date.new(Date.today.year,Date.today.month)
  $global_date_next ||= Date.new(Date.today.year,Date.today.month + 1)

  before_filter :authentication
  before_filter :authorize
  delegate :allow?, to: :current_permission

  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_page
  helper_method :allow?

  helper_method :my_var

  def change_date
    $global_date = Date.new(params[:year].to_i, params[:month].to_i)
    $global_date_next = Date.new(params[:year].to_i, params[:month].to_i + 1)
  end

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

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def current_resource
    nil
  end

  def authorize
    if !current_permission.allow?(params[:controller], params[:action], current_resource)
      redirect_to root_url, alert: "Превышены права !"
    end

  end

  def authentication
    #if !current_user && controller_name != "main" && controller_name != "users" && controller_name != "sessions"
    #  redirect_to root_url, alert: "Для начала работы, пожалуйста зарегестрируйтесь"
    #end
  end

end
