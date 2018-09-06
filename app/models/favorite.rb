class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :gif
  
  def self.favorites_sorted_by_category
    joins(:gif).order('gifs.categories.name')
  end  
end