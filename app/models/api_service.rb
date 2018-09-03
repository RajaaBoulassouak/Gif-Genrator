# require 'net/http'
# require 'json'
# 
# 
# class ApiService
# 
#   def initialize(category)
#     key = ENV['giphy_key']
# 
#     url = "https://api.giphy.com/v1/gifs/random?api_key=#{key}&tag=#{category}&rating=G"
#     uri = URI.parse(url)
#     response = Net::HTTP.get(uri)
#     @image_obj = JSON.parse(response)
#   end
# 
#   def parse_json
#     @image_obj["data"].map do |image|
#       image["images"]["original"]["url"]
#     end
#   end
# 
# end