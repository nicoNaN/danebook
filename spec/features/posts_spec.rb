require 'rails_helper'

feature 'Posts feature testing' do
	let(:user){ create(:user) }
  let(:second_user){ create(:user) }
  
  context 'as a signed-in user' do    
    scenario 'can create a post on their own timeline' do
      sign_in(user)
      visit user_timeline_path(user.id)
      fill_in 'post[content]', with: 'Test post'
      click_button 'Post'
      
      expect(page).to have_content('Post was successfully created.')
    end
    
    scenario 'can delete a post on their own timeline' do
      sign_in(user)
      visit user_timeline_path(user.id)
      
			expect{ click_link 'Delete' }.to change(Post, :count).by -1
      expect(page).to have_content('Post was successfully destroyed.')
    end
    
    scenario "cannot create a post on someone else's timeline" do
      sign_in(user)
      visit user_timeline_path(second_user.id)
      
      expect(page).to_not have_button('Post')
    end
  end
	
end