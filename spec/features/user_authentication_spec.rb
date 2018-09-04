require 'rails_helper'

describe 'registration and login/logout' do
  describe 'registration' do
    it 'should register a new user' do 
      username = 'Fay'
      email = 'fay@email.com'
      
      visit root_path
      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in :user_name, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: 'test123'
      fill_in :user_password_confirmation, with: 'test123'
      click_on 'Create User'
      
      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Successfully created account for #{User.last.name}!")
    end 
 
    it 'should not register a new user if invalid entry' do 
      user_1 = User.create!(name: 'Fay', email: 'fay@email.com', password: 'test123', password_confirmation: 'test123')
      username = 'Mia'
      email = 'fay@email.com'
      
      visit root_path
      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in :user_name, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: 'test123'
      fill_in :user_password_confirmation, with: 'test123'
      click_on 'Create User'
      
      expect(current_path).to eq(users_path)
      expect(page).to have_content('Oops, could not create account. Please use a valid email and password and try again.')
    end 
  end
  
  describe 'login/logout' do 
    it 'should allow user to log in and out' do 
      user = User.create!(name: 'Fay', email: 'fay@email.com', password: 'test123', password_confirmation: 'test123')
      
      visit root_path
      click_on 'Log In'

      expect(current_path).to eq(login_path)

      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on 'Log In!'
      
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Logged in as #{user.name}")
      
      click_on 'Log Out'
      
      expect(current_path).to eq(root_path)
      expect(page).to have_content('You have been successfully logged out!')
    end 
  end

  describe 'user can not log in if invalid entry' do 
    it 'should not allow user to log in' do 
      user = User.create!(name: 'Fay', email: 'fay@email.com', password: 'test123', password_confirmation: 'test123')
      
      visit root_path
      click_on 'Log In'

      expect(current_path).to eq(login_path)

      fill_in :email, with: user.email
      fill_in :password, with: 'test000'
      click_on 'Log In!'
      
      expect(current_path).to eq(login_path)
      expect(page).to have_content('Incorrect email or password, try again!')
    end 
  end
end


