class Huddle < ActiveRecord::Base
  has_many :users,
    through: :huddle_users

  has_many :huddle_users

  validates_presence_of :size_of_huddle
  validates_presence_of :skill_level

  validates :size_of_huddle, numericality:{
    greater_than: 1
  }
  validates :skill_level, inclusion:{ in: %w(
    Beginner Average Casual Advanced Any ),
    message: "%{value} is not a valid skill level/range"
  }



end
