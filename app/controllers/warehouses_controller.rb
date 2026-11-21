class WarehousesController < ApplicationController
  def index
    render json: Warehouse.all
  end

  def show
    render json: Warehouse.find(params[:id]), include: [ :shops, :products ]
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      render json: @warehouse, status: :created
    else
      render json: @warehouse.errors, status: :unprocessable_entity
    end
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    if @warehouse.update(warehouse_params)
      render json: @warehouse, status: :ok
    else
      render json: @warehouse.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @warehouse = Warehouse.find(params[:id])
    if @warehouse.destroy
      render json: @warehouse, status: :ok
    else
      render json: @warehouse.errors, status: :unprocessable_entity
    end
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:address, :specialization, :grade)
  end
end
