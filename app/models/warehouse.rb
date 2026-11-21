class Warehouse < ApplicationRecord
  has_many :warehouse_products, dependent: :destroy
  has_many :products, through: :warehouse_products

  has_many :shops, dependent: :destroy
end
