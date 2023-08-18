class Order < ApplicationRecord
  belongs_to :products
  has_one :payment
end
