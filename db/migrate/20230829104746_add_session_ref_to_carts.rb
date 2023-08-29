class AddSessionRefToCarts < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :session, null: false, foreign_key: true
  end
end
