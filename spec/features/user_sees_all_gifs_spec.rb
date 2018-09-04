require 'rails_helper'

describe 'user visits gif index page' do
  it 'user can see all gifs' do
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
end