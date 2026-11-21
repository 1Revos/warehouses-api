class ShopsController < ApplicationController
  def show
    render json: Shop.find(params[:id]), include: [ :warehouse, :products ]
  end

  def index
    @shop = Shop.all
    render json: @shop
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      render json: @shop, status: :created
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      render json: @shop, status: :ok
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    if @shop.destroy
      render json: @shop, status: :ok
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :specialization, :city, :warehouse_id)
  end
end
