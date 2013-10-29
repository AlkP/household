class AccountsController < ApplicationController

  def new
    @account = Account.new()
    @product_list = my_accounts.count(group: :title)
    @default_type_account = my_type_accounts.where( :main => true ).first.id if my_type_accounts.where( :main => true ).count > 0
  end

  def create
    data = params[:account]["date_amount(1i)"] + "/" + params[:account]["date_amount(2i)"] + "/" + params[:account]["date_amount(3i)"]
    @date_sales = Date.parse(data)
    @account = Account.new(:date_amount => @date_sales,
                           :title => params[:account][:title],
                           :amount => params[:account][:amount],
                           :shop_id => params[:account][:shop_id],
                           :user_id => current_user.id,
                           :type_account_id => params[:account][:type_account_id])
    if (@account.save)
      redirect_to accounts_path
    else
      flash.now.alert = "Некорректные данные"
      render 'new'
    end
  end

  def edit
    @account = current_resource
    @product_list = my_accounts.count(group: :title)
  end

  def update

    @account = current_resource
    @product_list = my_accounts.count(group: :title)

    @account = current_resource
    data = params[:account]["date_amount(1i)"] + "/" + params[:account]["date_amount(2i)"] + "/" + params[:account]["date_amount(3i)"]
    @date_sales = Date.parse(data)

    if @account.update(:date_amount => @date_sales,
                       :title => params[:account][:title],
                       :amount => params[:account][:amount],
                       :shop_id => params[:account][:shop_id],
                       :type_account_id => params[:account][:type_account_id])
      redirect_to accounts_path
    else
      flash.now.alert = "Некорректные данные"
      render 'edit'
    end
  end

  def show
    @account = current_resource
  end

  def index
    current_page_set("accounts")
    @accounts = my_accounts_period
  end

  def destroy
    @account = current_resource
    @account.destroy
    redirect_to accounts_path
  end


  private

  def my_accounts
    Account.my_all(current_user)
  end

  def my_accounts_period
    Account.my_period(current_user)
  end

  def my_type_accounts
    TypeAccount.my_all(current_user)
  end

  def my_shops
    Shop.my_all(current_user)
  end

  def account_params
    params.require(:account).permit(:title, :amount, :date_amount, :shop_id, :type_account_id)
  end

  def current_resource
    @current_resource ||= Account.find(params[:id]) if params[:id]
  end

end
