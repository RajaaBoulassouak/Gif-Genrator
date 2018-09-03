require 'rails_helper'

describe 'user visits gif index page' do
  it 'user can see all gifs' do
    user = User.create!(name: "Fay", email: "fay@gmail.com", password: "Test123")
    gif_1 = Gif.create!(image_path: "https://giphy.com/gifs/chihuahua-funny-cute-wW95fEq09hOI8")
    gif_2 = Gif.create!(image_path: "https://giphy.com/gifs/viralhog-xULW8PLGQwyZNaw68U")

    visit gifs_path

    expect(current_path).to eq(gifs_path)
    expect(page).to have_css("#image_#{gif_1.id}")
    expect(page).to have_css("#image_#{gif_2.id}")
    save_and_open_page
  end
end