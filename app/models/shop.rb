class Shop < ApplicationRecord
  has_many :shop_products, dependent: :destroy
  has_many :products, through: :shop_products

  belongs_to :warehouse
end
