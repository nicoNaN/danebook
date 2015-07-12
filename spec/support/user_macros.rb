module UserMacros
  def create_valid_user
		fill_in 'user_first_name', with: 'Test'
		fill_in 'user_last_name', with: 'User'
		fill_in 'user_email', with: 'TestUser@foo.bar'
		fill_in 'user_password', with: 'ayy_lmao'
		fill_in 'user_password_confirmation', with: 'ayy_lmao'
		select '1905', from: 'user_birthday_1i'
		select 'May', from: 'user_birthday_2i'
		select '19', from: 'user_birthday_3i'
		choose 'user_gender_male'
  end

  def create_invalid_user
		fill_in 'user_first_name', with: ''
		fill_in 'user_last_name', with: ''
		fill_in 'user_email', with: 'TestUser'
		fill_in 'user_password', with: 'ayy_lmao'
		fill_in 'user_password_confirmation', with: 'ayy_lmao'
		select '1905', from: 'user_birthday_1i'
		select 'May', from: 'user_birthday_2i'
		select '19', from: 'user_birthday_3i'
		choose 'user_gender_male'
  end
  
   def sign_in(user)
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  
  def bad_sign_in(user)
    visit root_path
    fill_in 'Email', with: user.email + 'bad'
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  
  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def signed_in_user?
    !!current_user
  end
end
