class Gif < ApplicationRecord
  validates_presence_of :image_path
  
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites
  
  def self.gifs_sorted_by_category
    joins(:category).order('categories.name')
  end
  
  def self.favorites_sorted_by_category
    joins(:favorites).order('categories.name')
  end
  # joins(:items).order("items.unit_price desc").first.name
end
