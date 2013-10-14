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

  # def huddle_members
  #   huddle_members = self.huddle_users
  #   member_array = []

  #   huddle_members.each do |member|
  #     username = User.where(id: member.user_id).first.username
  #     email = User.where(id: member.user_id).first.email
  #     if username != nil
  #       member_array << username
  #     else
  #       member_array << email
  #     end
  #   end
  #   member_array
  # end

  class <<self
    def current_users_huddle_finder(user)
      currently_in = HuddleUser.where(user_id: user.id).order("huddle_id ASC")
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
