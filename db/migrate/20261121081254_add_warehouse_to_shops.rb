class AddWarehouseToShops < ActiveRecord::Migration[8.1]
  def change
    add_reference :shops, :warehouse, null: false, foreign_key: true
  end
end
