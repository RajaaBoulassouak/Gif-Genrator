require 'rails_helper'

describe 'user visits gif index page' do
  it 'should show all gifs' do
    user = User.create!(name: 'Fay', email: 'fay@gmail.com', password: 'Test123')
    category = Category.create!(name: 'Pets')
    gif_1 = category.gifs.create!(image_path: 'https://giphy.com/gifs/chihuahua-funny-cute-wW95fEq09hOI8')
    gif_2 = category.gifs.create!(image_path: 'https://giphy.com/gifs/viralhog-xULW8PLGQwyZNaw68U')
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gifs_path

    expect(current_path).to eq(gifs_path)
    expect(page).to have_css("#image_#{gif_1.id}")
    expect(page).to have_css("#image_#{gif_2.id}")
  end
  
  # it 'should show all gifs ordered by category sorted alphabetically' do
  #   user = User.create!(name: 'Fay', email: 'fay@gmail.com', password: 'Test123')
  #   category_1 = Category.create!(name: 'Pets')
  #   gif_1 = category_1.gifs.create!(image_path: 'https://giphy.com/gifs/chihuahua-funny-cute-wW95fEq09hOI8')
  #   category_2 = Category.create!(name: 'Funny')
  #   gif_2 = category_2.gifs.create!(image_path: 'https://media3.giphy.com/media/110F1JFzWKtiA8/giphy.gif')
  # 
  # 
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  # 
  #   visit gifs_path
  # 
  #   expect(current_path).to eq(gifs_path)
  #   expect(page).to have_content("#{gif_2.category.name} #{gif_1.category.name}")
  # end
end