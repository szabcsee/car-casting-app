class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :address, :center, :status, :access_token, :buzzer, :lock
end
