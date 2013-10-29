class ShopsController < ApplicationController

  def new
    @shop = Shop.new()
  end

  def index
    current_page_set("shops")
    #@shops = Shop.where(:user_id => current_user.id)
    @shops = my_shops
  end

  def create
    @shop = Shop.new(:name => params[:shop][:name],
                     :user_id => current_user.id,
                     :address => params[:shop][:address])
    #@shop = shop_params

    if @shop.save
      render 'edit'
    else
      render 'new'
    end
  end

  def edit
    @shop = current_resource
  end

  def update
    @shop = current_resource

    if @shop.update(shop_params)
      render 'edit'
    else
      render 'edit'
    end
  end

  def destroy
    @shop = current_resource
    @shop.destroy
    redirect_to shops_path
  end

  private

  def my_shops
    Shop.my_all(current_user)
  end

  def shop_params
    #Shop.new(:name => params[:shop][:name], :user_id => current_user.id, :address => params[:shop][:address])
    params.require(:shop).permit(:name, :address, :latitude, :longitude,)
  end

  def current_resource
    @current_resource ||= Shop.find(params[:id]) if params[:id]
  end

end
