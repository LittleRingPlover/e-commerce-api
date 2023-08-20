class ChangeDiscountIdNullableInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :discount_id, :bigint, null: true
  end
end
