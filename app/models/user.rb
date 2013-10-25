class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         :confirmable

  has_many :huddles,
    through: :huddle_users

  has_many :huddle_users

  validates_presence_of :email
  validates_presence_of :city

  class<< self
    def user_signed_in?(current_user)
      if current_user != nil
        true
      else
        false
      end
    end
  end
end
