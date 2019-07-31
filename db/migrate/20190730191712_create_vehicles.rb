class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :type
      t.string :subCategory
      t.string :subType
      t.string :model
      t.date :year
      t.string :body
      t.integer :meter
      t.string :fuel
      t.string :condition
      t.integer :doors
      t.integer :seats
      t.string :extras
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
