class Product < ApplicationRecord
  has_many :shop_products, dependent: :destroy
  has_many :shops, through: :shop_products

  has_many :warehouse_products, dependent: :destroy
  has_many :warehouses, through: :warehouse_products
end
