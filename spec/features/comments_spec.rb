require 'rails_helper'

feature 'Comments feature testing' do
	let(:user){ create(:user) }
  let(:second_user){ create(:user) }
  
  context 'as a signed-in user' do    
    scenario 'can comment on a post on their own timeline' do
      sign_in(user)
      visit user_timeline_path(user.id)
      fill_in 'comment[content]', with: 'Test comment'
      click_button 'Comment'
      
      expect(page).to have_content('Comment was successfully created.')
    end
    
    scenario "can comment on a post on another user's timeline" do
      sign_in(user)
      visit user_timeline_path(second_user.id)
      fill_in 'comment[content]', with: 'Test comment'
      click_button 'Comment'
      
      expect(page).to have_content('Comment was successfully created.')
    end
  end
	
end