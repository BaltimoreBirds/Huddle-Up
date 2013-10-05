class HuddleUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :huddle

  validates_presence_of :user_id
  validates_presence_of :huddle_id

end
