# == Schema Information
#
# Table name: vehicle_bodies
#
#  id              :integer          not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  vehicle_type_id :integer
#
# Indexes
#
#  index_vehicle_bodies_on_vehicle_type_id  (vehicle_type_id)
#

class VehicleBody < ApplicationRecord
  validates :name, presence: true
  validates :vehicle_type_id, presence: true
end
