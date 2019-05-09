class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.date :payment_date
      t.string :currency
      t.string :payment_type
      t.string :payment_method
      t.string :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
