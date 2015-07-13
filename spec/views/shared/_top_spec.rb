require 'rails_helper'

describe 'shared/_top.html.erb' do
  
  before do
    def view.signed_in_user?
      true
    end
    def view.current_user
      FactoryGirl.create(:user)
    end
    
    assign(:user, view.current_user)
    assign(:profile, view.current_user.profile)
  end
  
  it "displays 'Your profile' header when viewing own profile" do
    user = view.current_user
    def view.assigned_user_same_as_current?(user)
      true
    end
    
    render
    
    expect(rendered).to match('Your profile')
  end
    
  it "displays other user's name when viewing other profile" do
    user = view.current_user
    def view.assigned_user_same_as_current?(user)
      false
    end
    
    render
    
    expect(rendered).to match('Your profile')
  end
end