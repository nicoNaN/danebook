require 'rails_helper'

describe 'users/new.html.erb' do
  
  context 'unregistered user' do
    before do
      def view.signed_in_user?
        false
      end
      def view.current_user
        nil
      end
    end
    
    it 'sees the sign-up page' do
      user = User.new
      assign(:user, user)
      render
      
      expect(rendered).to match('Sign Up')
    end
  end
  
end