class User < ApplicationRecord
  has_many :favorites
  has_many :gifs, through: :favorites
  has_secure_password
	
  validates :email, presence: true, uniqueness: true
  validates_presence_of :name
  validates_presence_of :password, require: true
  validates_presence_of :role
  
  enum role: %w(default admin)
end
