require 'rails_helper'

describe Gif, type: :model do 
  describe 'Validations' do 
    it {should validate_presence_of(:image_path)}
  end 
  
  describe 'Relationships' do 
    it {should belong_to(:category)}
  end
end

  describe 'it can load gif' do
    it 'should load a gif' do
      category = Category.create(name: "Pets")
      gif = Gif.load_gif(category.name)

      expect(gif).not_to be_nil
    end
  end