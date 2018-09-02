require 'rails_helper'

describe 'user can sign up to create a new account' do 
  it 'should create a new user account' do 
    username = "Fay"
    email = "fay@email.com"
    password = "test123"
    
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in :user_name, with: username
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password
    click_on "Sign Up!"
    
    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Successfully created account for #{User.last.name}!")
  end 
end

describe 'user can not sign up to create a new account if invalid entry' do 
  it 'should not create a new user account' do 
    user_1 = User.create!(name: "Fay", email: "fay@email.com", password: "test123", password_confirmation: "test123")
    username = "Fay"
    email = "fay@email.com"
    password = "test123"
    
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in :user_name, with: username
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password
    click_on "Sign Up!"
    
    expect(page).to have_content("Oops, couldn't create account. Please use a valid email and password and try again.")
    expect(current_path).to eq(new_user_path)
  end 
end

describe 'user can log in and out' do 
  it 'should log user in and out' do 
    user = User.create!(name: "Fay", email: "fay@email.com", password: "test123", password_confirmation: "test123")
    email = "fay@email.com"
    password = "test123"
    
    visit root_path
    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :login_email, with: email
    fill_in :login_password, with: password
    click_on "Log In!"
    
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Logged in as #{user.name}")
    
    click_on "Log Out"
    
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Logged out!")
  end 
end

describe 'user can not log in if invalid entry' do 
  it 'should not log user in if invalid entry' do 
    user = User.create!(name: "Fay", email: "fay@email.com", password: "test123", password_confirmation: "test123")
    email = "fay@email.com"
    password = "test000"
    
    visit root_path
    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :login_email, with: email
    fill_in :login_password, with: password
    click_on "Log In!"
    
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Incorrect email or password, try again!")
  end 
end


