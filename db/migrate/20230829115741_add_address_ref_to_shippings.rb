class AddAddressRefToShippings < ActiveRecord::Migration[7.0]
  def change
    add_reference :shippings, :address, null: false, foreign_key: true
  end
end
