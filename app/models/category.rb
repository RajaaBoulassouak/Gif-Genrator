class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :gifs
  has_many :favorites, through: :gifs
  
end