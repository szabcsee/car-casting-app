class CreateVehicleCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_categories do |t|
      t.string :name
      t.references :vehicle_type, foreign_key: true

      t.timestamps
    end
  end
end
