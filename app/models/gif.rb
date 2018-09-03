class Gif < ApplicationRecord
  validates_presence_of :image_path
  belongs_to :category

  def self.load_gif(category)
    key = ENV['giphy_key']
    url = "https://api.giphy.com/v1/gifs/random?api_key=#{key}&tag=#{category}&rating=G"
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    image_object = JSON.parse(response)
    if Gif.find_by(url: image_object["data"]["image_url"])
      byebug
      self.load_gif(category)
    else 
      image_object
    end
  end

end
