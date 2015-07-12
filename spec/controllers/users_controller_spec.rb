require 'rails_helper'

describe UsersController do

  describe 'users access' do
    let(:user){ create(:user) }
    let(:second_user){ create(:user) }

    describe 'POST #create' do
      context 'creating a valid user' do
        it "redirects to the new user's profile" do
          post :create, user: attributes_for(:user)
          expect(response).to redirect_to user_profile_path(assigns(:user))
        end
  
        it 'actually creates the user' do
          expect{ post :create, user: attributes_for(:user) }.to change(User, :count).by 1
        end
        
        it 'signs the user in' do
          post :create, user: attributes_for(:user)
          expect(signed_in_user?).to eq(true)
        end
        
        it 'automatically generates a profile for the user' do
          expect{ post :create, user: attributes_for(:user) }.to change(Profile, :count).by 1
        end
      end
      
      context 'creating an invalid user' do
        it 're-renders the new user form' do
          post :create, user: attributes_for(:user, first_name: nil)
          expect(response).to render_template :new
        end

        it 'does not create a user' do
          expect{ post :create, user: attributes_for(:user, first_name: nil) }.to change(User, :count).by(0)
        end
        
        it 'does not sign the user in' do
          post :create, user: attributes_for(:user, first_name: nil)
          expect(signed_in_user?).to eq(false)
        end
        
        it 'does not automatically generate a profile for the user' do
          expect{ post :create, user: attributes_for(:user, first_name: nil) }.to change(Profile, :count).by 0
        end
      end
    end
  end

end
