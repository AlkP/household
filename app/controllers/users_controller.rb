class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Вы успешно зарегестрировались в системе "
    else
      render "new"
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params

    if params[:user][:email] == "admin@admin.com"
      return :email => params[:user][:email],
             :password => params[:user][:password],
             :password_confirmation => params[:user][:password_confirmation],
             :admin => true
    else
      return :email => params[:user][:email],
             :password => params[:user][:password],
             :password_confirmation => params[:user][:password_confirmation],
             :admin => false
    end

  end

  #def user_params_admin
  #  params.require(:user).permit(:email, :password, :password_confirmation, :admin => true)
  #end

end
