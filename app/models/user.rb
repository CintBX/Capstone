class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :discussions, dependent: :destroy
  has_many :channels, through: :discussions

 # Possibly validate :username
 validates_presence_of :name

 def first_name
 	self.name.split.first
 end

 def last_name
	self.name.split.last
 end
end
