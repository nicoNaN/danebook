# require 'rails_helper'

# describe PostsController do

#   describe 'posts access' do
#     let(:user){ create(:user) }
#     let(:test_post){ create(:post) }
#     let(:second_test_post){ create(:post) }
    
#     before :each do
#       session[:user_id] = user.id
#     end

#     describe 'POST #create' do
#       context 'creating a valid post' do
#         it "redirects to the previous page" do
#           post :create, post: attributes_for(:post)
#           expect(response).to redirect_to root_path
#         end
  
#         it 'creates comment in db' do
#           expect{ post :create, comment: attributes_for(:comment) }.to change(Comment, :count).by 1
#         end
        
#         it 'persists the comment' do
#           post :create, comment: attributes_for(:comment)
#           expect(assigns(:comment)).to be_persisted
#         end
#       end
      
#       context 'creating an invalid comment' do
#         it "redirects to the previous page" do
#           post :create, comment: attributes_for(:comment, content: nil)
#           expect(response).to redirect_to root_path
#         end
  
#         it 'does not create comment in db' do
#           expect{ post :create, comment: attributes_for(:comment, content: nil) }.to change(Comment, :count).by 0
#         end
        
#         it 'does not persist the comment' do
#           post :create, comment: attributes_for(:comment, content: nil)
#           expect(assigns(:comment)).to_not be_persisted
#         end
#       end
#     end
    
#     describe 'DELETE #destroy' do
#       before { comment }
#       it 'user can delete their own comment' do
#         expect{ delete :destroy, { id: comment.id }, { user_id: comment.user.id } }.to change(Comment, :count).by -1
#       end
      
#       it "user cannot delete someone else's comment" do
#         expect{ delete :destroy, { id: second_comment.id }, { user_id: comment.user.id } }.to change(Comment, :count).by 0
#       end
#     end
#   end

# end
