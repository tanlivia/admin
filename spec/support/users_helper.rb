module UserHelper
  def login(a)
    visit admin_path
    fill_in 'session[username]', with: a.username
    fill_in 'session[password]', with: a.password
    click_button 'Log In'
  end
end