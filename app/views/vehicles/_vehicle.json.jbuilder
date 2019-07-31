json.extract! vehicle, :id, :name, :type, :subCategory, :subType, :model, :year, :body, :meter, :fuel, :condition, :doors, :seats, :extras, :user_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
