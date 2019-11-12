class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.string :post_code
      t.string :city
      t.string :address2
      t.string :address1
      t.string :telephone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end