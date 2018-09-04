require 'rails_helper'

describe 'user marks a gif as their favorite' do
  describe "they click on 'Add Gif To Your Favorites'" do
    it 'adds a gif to user show page' do
      user = User.create!(name: 'Fay', email: 'fay@gmail.com', password: 'Test123')
      category = Category.create!(name: 'Pets')
      gif = category.gifs.create!(image_path: 'https://giphy.com/gifs/chihuahua-funny-cute-wW95fEq09hOI8')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit gifs_path
      click_on 'Add Gif To Your Favorites'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_css("#image_#{gif.id}")
    end
  end
end

describe 'user unfavorites' do
  describe "they click 'Unfavorite Gif'" do
    it 'removes gif from user show page' do
      user = User.create!(name: 'Fay', email: 'fay@gmail.com', password: 'Test123')
      category = Category.create!(name: 'Pets')
      gif = category.gifs.create!(image_path: 'https://giphy.com/gifs/chihuahua-funny-cute-wW95fEq09hOI8')
      gif.favorites.create(user: user)
      
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_on 'Unfavorite Gif'

      expect(current_path).to eq(user_path(user))
      expect(page).to_not have_css("#image_#{gif.id}")
    end
  end
end

