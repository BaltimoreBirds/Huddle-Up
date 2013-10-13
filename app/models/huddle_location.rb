class HuddleLocation < ActiveRecord::Base

  belongs_to :location
  belongs_to :huddle

  validates_presence_of :location_id
  validates_presence_of :huddle_id
end
