class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :gif
  
  def self.favorites_sorted_by_category
    joins.(:gifs).group(:category.id).sort(:category.name)
  end
end