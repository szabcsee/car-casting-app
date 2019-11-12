# == Schema Information
#
# Table name: vehicle_models
#
#  id               :integer          not null, primary key
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  vehicle_brand_id :integer
#
# Indexes
#
#  index_vehicle_models_on_vehicle_brand_id  (vehicle_brand_id)
#

class VehicleModel < ApplicationRecord
  belongs_to :vehicle_brand
end
