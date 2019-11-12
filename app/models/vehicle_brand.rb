# == Schema Information
#
# Table name: vehicle_brands
#
#  id              :integer          not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  vehicle_type_id :integer
#
# Indexes
#
#  index_vehicle_brands_on_vehicle_type_id  (vehicle_type_id)
#

class VehicleBrand < ApplicationRecord
end
