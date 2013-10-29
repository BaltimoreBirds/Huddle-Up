class Huddle < ActiveRecord::Base
  # include IceCube

  attr_accessor :recurring_rule

  serialize :recurring_rule, Hash

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

  def recurring_rule=(new_rule)
    if RecurringSelect.is_valid_rule?(new_rule)
      write_attribute(:recurring_rule, RecurringSelect.dirty_hash_to_rule(new_rule).to_hash)
    else
      write_attribute(:recurring_rule, nil)
    end
  end

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

    def display_pending_huddles
      pending_huddles = []
      self.all.each do |huddle|
        if (huddle.time_and_date - DateTime.now) > 0
          pending_huddles << huddle
        end
      end
      pending_huddles
    end

  end

private

end
