class Vehicle < ApplicationRecord
  include ActiveModel::Validations
  validates :user_id, presence: true
  validates :vehicle_type_id, presence: true
  validates :vehicle_brand_id, presence: true
  validates :vehicle_condition_id, presence: true
  validates :vehicle_body_id, presence: true

  belongs_to :user
  belongs_to :vehicle_body
  belongs_to :vehicle_brand
  belongs_to :vehicle_condition
  belongs_to :vehicle_fuel
  belongs_to :vehicle_model
  belongs_to :vehicle_type
end
s