# == Schema Information
#
# Table name: vehicle_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VehicleType < ApplicationRecord
  def slugified_name
    self.name.parameterize
  end
end
