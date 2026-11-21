class CreateWarehouses < ActiveRecord::Migration[8.1]
  def change
    create_table :warehouses do |t|
      t.string :address
      t.string :specialization
      t.integer :grade

      t.timestamps
    end
  end
end
