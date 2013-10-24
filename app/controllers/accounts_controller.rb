class AccountsController < ApplicationController

  def new
    @account = Account.new()
    @shop_list = Shop.all
    @product_list = Account.all.count(group: :title)
  end

  def create
    @shop = Shop.where(:name => params[:account][:shop_name])
    data = params[:account]["date_amount(1i)"] + "/" + params[:account]["date_amount(2i)"] + "/" + params[:account]["date_amount(3i)"]
    @date_sales = Date.parse(data)
    if @shop.count == 1
      #@account = Account.new(account_params)
      @account = Account.new(:date_amount => @date_sales, :title => params[:account][:title], :amount => params[:account][:amount],:shop_id => @shop.first.id)
      @shop = Shop.where(:name => params[:account][:shop_name])
      if (@account.save)
        redirect_to accounts_path
      else
        render 'new'
      end

    else
      flash.now.alert = "Укажите корректный магазин, если его нет в списке, предварительно заведите его."
      render 'edit'
    end

  end

  def edit
    @account = Account.find(params[:id])
    @shop_list = Shop.all
    @product_list = Account.all.count(group: :title)
    @shop_name = Shop.find(@account.shop_id).name if !@account.shop_id.nil?
  end

  def update
    @account = Account.find(params[:id])
    @shop_list = Shop.all
    @product_list = Account.all.count(group: :title)

    @shop = Shop.where(:name => params[:account][:shop_name])

    if @shop.count == 1
      @shop_name = @shop.name

      @account = Account.find(params[:id])
      data = params[:account]["date_amount(1i)"] + "/" + params[:account]["date_amount(2i)"] + "/" + params[:account]["date_amount(3i)"]
      @date_sales = Date.parse(data)

      if @account.update(:date_amount => @date_sales, :title => params[:account][:title], :amount => params[:account][:amount],:shop_id => @shop.first.id)
        redirect_to accounts_path
      else
        render 'edit'
      end
    else
      flash.now.alert = "Укажите корректный магазин, если его нет в списке, предварительно заведите его."
      render 'edit'
    end

  end

  def show
    @account = Account.find(params[:id])
  end

  def index
    current_page_set("accounts")
    @accounts = Account.all
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to accounts_path
  end


  private
  def account_params
    params.require(:account).permit(:title, :amount, :date_amount, :shop_id)
  end

end
