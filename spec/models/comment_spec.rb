require 'rails_helper'

describe Comment do
  let(:comment){ build(:comment) }

  describe 'associations' do
    it 'responds to the user association' do
      expect(comment).to respond_to(:user)
    end

    it 'responds to the comments association' do
      expect(comment).to respond_to(:post)
    end

    it 'responds to the likes association' do
      expect(comment).to respond_to(:likes)
    end
  end
end
