class HuddleSerializer < ActiveModel::Serializer
  attributes :id, :skill_level, :occurrences

  has_many :users
end
