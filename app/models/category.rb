class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :gifs
  has_many :favorites, through: :gifs
  
  # def self.gifs_sorted_by_category
  #   joins(:gifs).group('categories.id').order(:name)
  # end
  
end