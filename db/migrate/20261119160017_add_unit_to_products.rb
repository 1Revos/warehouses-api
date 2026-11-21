class AddUnitToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :unit, :string
  end
end
