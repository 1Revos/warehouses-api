class AddCityToShops < ActiveRecord::Migration[8.1]
  def change
    add_column :shops, :city, :string
  end
end
