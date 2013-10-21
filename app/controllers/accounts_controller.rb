class AccountsController < ApplicationController
  def new
    @account = Account.new()
    #true ? jopa : suka
  end

  def create
    #render text: params[:post].inspect
    @account = Account.new(account_params)

    if (@account.save)
      redirect_to accounts_path
    else
      render 'new'
    end


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
