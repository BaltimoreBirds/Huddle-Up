class Huddle < ActiveRecord::Base

  has_many :users,
    through: :huddle_users

  has_many :huddle_users,
    dependent: :destroy

  belongs_to :location,
    inverse_of: :huddles

  validates_presence_of :size_of_huddle
  validates_presence_of :skill_level
  validates_presence_of :time_and_date
  validates :size_of_huddle, numericality:{
    greater_than: 1
  }
  validates :skill_level, inclusion:{ in: %w(
    Beginner Average Casual Advanced Any ),
    message: "%{value} is not a valid skill level/range"
  }
  validates_datetime :time_and_date, on_or_after: lambda{(DateTime.now + 19.minutes)}

  def huddle_full?
    if self.size_of_huddle.to_i == self.users.count
       return "This Huddle is full"
    else
      return false
    end
  end

  class <<self
    def current_users_huddle_finder(userid)
      currently_in = HuddleUser.where(user_id: userid).order("huddle_id ASC")
      huddles = []

      unless currently_in == []
        currently_in.each do |huddle_user|
            if (Huddle.where(id: huddle_user.huddle_id).first.time_and_date - DateTime.now) > 0
              huddles << Huddle.where(id: huddle_user.huddle_id).first
            end
        end
      end
      huddles
    end
  end
end
