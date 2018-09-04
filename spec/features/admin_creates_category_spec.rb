require 'rails_helper'

describe 'Admin visits new category page' do
  it 'allows admin to create a new category' do
    admin = User.create(name: 'Rajaa', password: '1234', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path
    
    expect(current_path).to eq(new_admin_category_path)
    expect(page).to have_content('Create a New Category')
  end
end

describe 'Default user can not create a new category' do
  it 'does not allow default user to visit new category page' do
    user = User.create(name: 'Jimmy', password: '5678', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_category_path

    expect(page).to_not have_content('Create a New Category') 
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end