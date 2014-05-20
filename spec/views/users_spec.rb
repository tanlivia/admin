require 'spec_helper'

feature 'User Management', %q{
  Execute some user function
} do
  background do
    @user = FactoryGirl.create(:user)
  end

  scenario 'Sign Up should add a new user' do
    visit sign_up_path
    expect {
      fill_in 'user_username', with: 'Lihui'
      fill_in 'user_password', with: 'secret'
      fill_in 'user_password_confirmation', with: "secret"
      click_button 'Create User'
    }.to change(User, :count).by(1)
  end
end