class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :init

  has_one :user_info

  def self.year_in_school_choices
    ["Freshman", "Sophomore", "Junior", "Senior"]
  end

  def self.skillset_choices
    ["Hacker", "Designer", "Marketer", "I'm just awesome"]
  end

private

def init
  UserInfo.create(user: self)
end

end