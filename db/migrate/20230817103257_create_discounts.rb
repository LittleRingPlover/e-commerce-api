class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :title
      t.text :description
      t.decimal :discount_percent

      t.timestamps
    end
  end
end
