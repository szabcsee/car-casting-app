class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :theme
      t.boolean :new_user_registration

      t.timestamps
    end
  end
end
