class HuddleUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :huddle

  validates_presence_of :user
  validates_presence_of :huddle

end
