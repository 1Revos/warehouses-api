class AddExpirationDaysToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :expiration_days, :string
  end
end
