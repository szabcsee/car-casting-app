# == Schema Information
#
# Table name: vehicles
#
#  id                   :integer          not null, primary key
#  act_type             :string
#  doors                :integer
#  driveability         :string
#  extras               :string
#  meter                :integer
#  mobility             :string
#  name                 :string
#  seats                :integer
#  year                 :date
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :integer
#  vehicle_body_id      :integer
#  vehicle_brand_id     :integer
#  vehicle_category_id  :integer
#  vehicle_condition_id :integer
#  vehicle_fuel_id      :integer
#  vehicle_model_id     :integer
#  vehicle_type_id      :integer
#
# Indexes
#
#  index_vehicles_on_user_id               (user_id)
#  index_vehicles_on_vehicle_body_id       (vehicle_body_id)
#  index_vehicles_on_vehicle_brand_id      (vehicle_brand_id)
#  index_vehicles_on_vehicle_category_id   (vehicle_category_id)
#  index_vehicles_on_vehicle_condition_id  (vehicle_condition_id)
#  index_vehicles_on_vehicle_fuel_id       (vehicle_fuel_id)
#  index_vehicles_on_vehicle_model_id      (vehicle_model_id)
#  index_vehicles_on_vehicle_type_id       (vehicle_type_id)
#

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
  belongs_to :vehicle_category
  belongs_to :vehicle_model
  belongs_to :vehicle_type

  has_many_attached :vehicle_picture
end
s
