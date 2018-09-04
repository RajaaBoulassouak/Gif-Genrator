class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_presence_of :name
  validates_presence_of :password
  validates_presence_of :role
  
  has_many :favorites
  has_many :gifs, through: :favorites
  has_secure_password
	
  enum role: ['default', 'admin']
end
