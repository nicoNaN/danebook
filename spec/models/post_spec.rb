require 'rails_helper'

describe User do
  let(:post){ build(:post) }

  describe 'associations' do
    it 'responds to the user association' do
      expect(post).to respond_to(:user)
    end

    it 'responds to the comments association' do
      expect(post).to respond_to(:comments)
    end

    it 'responds to the likes association' do
      expect(post).to respond_to(:likes)
    end
  end
end
