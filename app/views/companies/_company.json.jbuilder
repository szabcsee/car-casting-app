json.extract! company, :id, :company_type, :vat, :billing_address1, :billing_address2, :city, :company_name, :tax_number, :company_number, :user_profile_id, :created_at, :updated_at
json.url company_url(company, format: :json)
