class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.string :access_token
      t.string :refresh_token
      t.datetime :expire_at

      t.timestamps
    end
  end
end
