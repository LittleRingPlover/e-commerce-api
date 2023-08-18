class Product < ApplicationRecord
  has_many :orders, through: :orders_products
  belongs_to :category
  belongs_to :discount
end
