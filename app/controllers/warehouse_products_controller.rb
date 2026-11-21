class WarehouseProductsController < ApplicationController
  def index
    render json: WarehouseProduct.all
  end

  def create
    @warehouse_product = WarehouseProduct.new(warehouse_params)
    if @warehouse_product.save
      render json: @warehouse_product, status: :created
    else
      render json: @warehouse_product.errors, status: :unprocessable_entity
    end
  end

  def update
    @warehouse_product = WarehouseProduct.find(params[:id])
    if @warehouse_product.update(warehouse_params)
      render json: @warehouse_product, status: :ok
    else
      render json: @warehouse_product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @warehouse_product = WarehouseProduct.find(params[:id])
    if @warehouse_product.destroy
      render json: @warehouse_product, status: :ok
    else
      render json: @warehouse_product.errors, status: :unprocessable_entity
    end
  end

  private

  def warehouse_params
    params.require(:warehouse_product).permit(:warehouse_id, :product_id, :quantity)
  end
end
