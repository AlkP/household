class AccountsController < ApplicationController
  def new
    #true ? jopa : suka
  end

  def create
    #render text: params[:post].inspect
    puts "suka " * 1000
    puts params[:account]
    puts " БЛЯ "
    @account = Account.new(account_params)

    @account.save
    redirect_to @account
  end

  def show
    @account = Account.find(params[:id])
  end

  def index
    @accounts = Account.all
    @filter = []
  end

  private
  def account_params
    params.require(:account).permit(:title, :amount, :date_amount)
  end

end
