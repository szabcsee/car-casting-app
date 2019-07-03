json.extract! user_profile, :id, :first_name, :last_name, :post_code, :city, :address2, :address1, :telephone, :user_id, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
