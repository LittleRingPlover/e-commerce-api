class Shipping < ApplicationRecord
  belongs_to :shipping_method
  belongs_to :order
  belongs_to :address
end
