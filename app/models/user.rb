class User < ApplicationRecord
  has_secure_password
	validates :email, presence: true, uniqueness: true
  validates_presence_of :name
  validates_presence_of :password, require: true
end
