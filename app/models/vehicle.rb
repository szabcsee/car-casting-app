class Vehicle < ApplicationRecord
  include ActiveModel::Validations
  validates_with VehicleValidator
  validates :user_id, presence: true
  validates :type, presence: true
  validates :brand, presence: true
  validates :condition, presence: true
  validates :body, presence: true

  belongs_to :user
  belongs_to :vehicle_body
  belongs_to :vehicle_brand
  belongs_to :vehicle_condition
  belongs_to :vehicle_fuel
  belongs_to :vehicle_model
  belongs_to :vehicle_type
end
