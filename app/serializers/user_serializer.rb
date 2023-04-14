class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo, :bio
  has_many :posts
end
