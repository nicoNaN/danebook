require 'rails_helper'

feature 'Users feature testing' do
	let(:user){ create(:user) }
  let(:second_user){ create(:user) }
	
	context 'as a visitor' do
		scenario 'can sign up for an account' do
      visit root_path
      
			create_valid_user
			
			expect{ click_button 'Sign Up!' }.to change(User, :count).by 1
      expect(page).to have_content 'User was successfully created.'
		end
    
		scenario 'cannot sign up for an account with bad info' do
      visit root_path
      
			create_invalid_user
			
			expect{ click_button 'Sign Up!' }.to change(User, :count).by 0
      expect(page).to have_content('errors prohibited this user from being saved')
		end
    
    scenario 'can sign in to existing account' do
      sign_in(user)
      
      expect(current_path).to eq(user_profile_path(user.id))
    end
    
    scenario 'cannot sign in to an invalid account' do
      bad_sign_in(user)
      
      expect(current_path).to eq(root_path)
    end
	end
  
  context 'as a signed-in user' do
    scenario 'can edit their own profile' do
      sign_in(user)
      click_link 'Edit your Profile'
      fill_in 'profile[college]', with: 'Test University'
      click_button 'Save Changes'
      
      expect(page).to have_content 'Updated your profile!'
    end
    
    scenario 'can post to their own timeline' do
      sign_in(user)
      visit user_timeline_path(user.id)
      fill_in 'post[content]', with: 'Test post'
      click_button 'Post'
      expect(page).to have_content('Post was successfully created.')
    end
    
    scenario "can post to another user's timeline" do
      sign_in(user)
      visit user_timeline_path(second_user.id)
      save_and_open_page
      fill_in 'comment[content]', with: 'Test comment'
      click_button 'Comment'
      expect(page).to have_content('Comment was successfully created.')
    end
  end
	
end