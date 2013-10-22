class AccountsController < ApplicationController
  def new
    @account = Account.new()
  end

  def create
    @account = Account.new(account_params)
    if (@account.save)
      redirect_to accounts_path
    else
      render 'new'
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    puts "suka " * 50
    puts params[:account][:shop_name]
    @account = Account.find(params[:id])

    if @account.update(account_params)
      #render 'edit'
      redirect_to accounts_path
    else
      render 'edit'
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  def index
    @accounts = Account.all
  end

  private
  def account_params
    params.require(:account).permit(:title, :amount, :date_amount)
  end

end
