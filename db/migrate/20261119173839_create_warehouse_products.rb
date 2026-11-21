class CreateWarehouseProducts < ActiveRecord::Migration[7.1] # оставьте вашу версию в скобках
  def change
    create_table :warehouse_products do |t|
      t.references :warehouse, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
