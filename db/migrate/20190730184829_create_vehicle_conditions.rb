class CreateVehicleConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_conditions do |t|
      t.string :name

      t.timestamps
    end
  end
end
