class VehicleType < ApplicationRecord
  def slugified_name
    self.name.parameterize
  end
end
