class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :jwt_token, :lock
end
