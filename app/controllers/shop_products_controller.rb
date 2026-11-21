class ShopProductsController < ApplicationController
  def index
    render json: ShopProduct.all
  end

  def create
    @shop_product = ShopProduct.new(shop_params)
    if @shop_product.save
      render json: @shop_product, status: :created
    else
      render json: @shop_product.errors, status: :unprocessable_entity
    end
  end

  def update
    @shop_product = ShopProduct.find(params[:id])
    if @shop_product.update(shop_params)
      render json: @shop_product, status: :ok
    else
      render json: @shop_product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @shop_product = ShopProduct.find(params[:id])
    if @shop_product.destroy
      render json: @shop_product, status: :ok
    else
      render json: @shop_product.errors, status: :unprocessable_entity
    end
  end

    private

  def shop_params
    params.require(:shop_product).permit(:shop_id, :product_id, :quantity)
  end
end
