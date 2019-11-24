class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :company_type
      t.boolean :vat
      t.string :billing_address1
      t.string :billing_address2
      t.string :city
      t.string :post_code
      t.string :company_name
      t.string :tax_number
      t.string :company_number
      t.references :user_profile, foreign_key: true

      t.timestamps
    end
  end
end
