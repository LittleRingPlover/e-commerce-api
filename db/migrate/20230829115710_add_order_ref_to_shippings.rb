class AddOrderRefToShippings < ActiveRecord::Migration[7.0]
  def change
    add_reference :shippings, :order, null: false, foreign_key: true
  end
end
