class HuddleSerializer < ActiveModel::Serializer
  attributes :id, :skill_level

  has_many :users
end
