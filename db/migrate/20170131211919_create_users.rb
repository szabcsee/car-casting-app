class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :access_token
      t.string :token_data
      t.string :phone
      t.text :address
      t.string :center
      t.string :status
      t.string :buzzer
      t.boolean :lock
      t.datetime :access_token_created_at

      t.timestamps
    end
  end
end
