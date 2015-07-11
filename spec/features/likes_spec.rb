require 'rails_helper'

feature 'Likes feature testing' do
	let(:user){ create(:user) }
  let(:second_user){ create(:user) }
  
  context 'as a signed-in user' do    
    scenario 'can like a post on their own timeline' do
      sign_in(user)
      visit user_timeline_path(user.id)
      
			expect{ click_link 'Like' }.to change(Like, :count).by 1
      expect(page).to have_content('Like was successfully created.')
    end
   
   scenario 'can remove a like from a post on their own timeline' do
     sign_in(user)
     visit user_timeline_path(second_user.id)
     click_link 'Like'
     
     expect{ click_link 'Unlike' }.to change(Like, :count).by -1
     expect(page).to have_content('Like was successfully destroyed.')
   end
  end
	
end