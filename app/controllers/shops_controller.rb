class ShopsController < ApplicationController

  def new
    @shop = Shop.new()
  end

  def index
    current_page_set("shops")
    @shops = Shop.all
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      render 'edit'
    else
      render 'new'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])

    if @shop.update(shop_params)
      render 'edit'
    else
      render 'edit'
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :latitude, :longitude)
  end

end
