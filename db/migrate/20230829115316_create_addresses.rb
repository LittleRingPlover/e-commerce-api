class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :apartment
      t.string :city
      t.string :zipcode

      t.timestamps
    end
  end
end
