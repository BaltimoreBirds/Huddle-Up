class Huddle < ActiveRecord::Base
  include IceCube

  serialize :occurrences, Hash

  before_save :set_occurrences

  attr_accessor :recurring_rules

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

  def schedule
    schedule = Schedule.new(self.time_and_date)
    if self.occurrences.blank?
      #no hago nada
    else
      schedule.add_recurrence_rule(RecurringSelect.dirty_hash_to_rule(self.occurrences))
    end
    schedule
  end

  def set_occurrences
    if RecurringSelect.is_valid_rule?(self.recurring_rules)
      write_attribute(:occurrences, RecurringSelect.dirty_hash_to_rule(self.recurring_rules).to_hash)
    else
      write_attribute(:occurrences, nil)
    end
  end

  class<< self
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

    # def update_recurring_huddles

    # end

  end

end
