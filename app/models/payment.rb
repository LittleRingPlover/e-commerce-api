class Payment < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :payment_method
end
