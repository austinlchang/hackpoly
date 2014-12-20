class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :init

  has_one :user_info

  def greeting
    first_name = self.user_info.first_name
    first_name.blank? ? self.email : first_name
  end

  def major
    self.user_info.major
  end

  def self.year_in_school_choices
    ["Freshman", "Sophomore", "Junior", "Senior"]
  end

  def self.skillset_choices
    ["Hacker", "Designer", "Marketer", "I'm just awesome"]
  end

private

def init
  self.user_info || UserInfo.create(user: self)
  self.admin = false
  self.save
end

end
