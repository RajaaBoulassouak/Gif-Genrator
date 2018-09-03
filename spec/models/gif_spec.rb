require 'rails_helper'

describe Gif, type: :model do 
  describe 'Validations' do 
    it {should validate_presence_of(:image_path)}
  end 
  
  describe 'Relationships' do 
    it {should belong_to(:category)}
  end
end