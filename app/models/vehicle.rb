class Vehicle < ApplicationRecord
  include ActiveModel::Validations
  validates_with VehicleValidator
  validates :user_id, presence: true
  validates :type, presence: true
  validates :brand, presence: true
  validates :condition, presence: true
  validates :body, presence: true

  belongs_to :user
end
