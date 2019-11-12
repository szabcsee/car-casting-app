class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.date :year
      t.integer :meter
      t.integer :doors
      t.integer :seats
      t.string :extras
      t.string :mobility
      t.string :driveability
      t.string :act_type
      t.references :vehicle_brand, foreign_key: true
      t.references :vehicle_type, foreign_key: true
      t.references :vehicle_category, foreign_key: true
      t.references :vehicle_model, foreign_key: true
      t.references :vehicle_body, foreign_key: true
      t.references :vehicle_condition, foreign_key: true
      t.references :vehicle_fuel, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
