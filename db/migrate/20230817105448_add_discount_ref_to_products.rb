class AddDiscountRefToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :discount, null: false, foreign_key: true
  end
end
