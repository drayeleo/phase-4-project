class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :password, :name
end
