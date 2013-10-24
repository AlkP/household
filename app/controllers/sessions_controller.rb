class SessionsController < ApplicationController
  def new
  end

  def create
    user =  User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Успешно вошли в систему"
    else
      flash.now.alert = "Неверная комбинация логин/пароль"
      render "new"
    end
  end

  def happy
    redirect_to 'http://shotners.herokuapp.com/QTByrKR'
  end

  def destroy
    session[:user_id] = nil
    #render "shotners/index"
    redirect_to root_url, :notice => "Вы вышли из системы"
  end
end

