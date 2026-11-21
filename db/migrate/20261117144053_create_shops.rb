class CreateShops < ActiveRecord::Migration[8.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :specialization

      t.timestamps
    end
  end
end
