require 'rails_helper'

describe User do
  let(:user){ build(:user) }

  describe 'attributes' do
    it 'all green when passed valid attributes' do
      expect(user).to be_valid
    end

    describe 'first name' do
      it 'is invalid if <3 or >24 characters long' do
        new_user_short = build(:user, first_name: "No")
        new_user_long = build(:user, first_name: "F" * 25)
        expect(new_user_short).to_not be_valid
        expect(new_user_long).to_not be_valid
      end

      it 'is valid if exactly 3 or 24 characters long' do
        new_user_short = build(:user, first_name: "Yes")
        new_user_long = build(:user, first_name: "F" * 24)
        expect(new_user_short).to be_valid
        expect(new_user_long).to be_valid
      end
    end

    describe 'last name' do
      it 'is invalid if <3 or >24 characters long' do
        new_user_short = build(:user, last_name: "No")
        new_user_long = build(:user, last_name: "F" * 25)
        expect(new_user_short).to_not be_valid
        expect(new_user_long).to_not be_valid
      end

      it 'is valid if exactly 3 or 24 characters long' do
        new_user_short = build(:user, last_name: "Yes")
        new_user_long = build(:user, last_name: "F" * 24)
        expect(new_user_short).to be_valid
        expect(new_user_long).to be_valid
      end
    end

    describe 'email' do
      it 'is invalid if not in the proper format' do
        new_user = build(:user, email: "fail")
        expect(new_user).to_not be_valid
      end
    end

    describe 'gender and birthday' do
      it 'invalid if gender is not present' do
        new_user = build(:user, gender: nil)
        expect(new_user).to_not be_valid
      end

      it 'invalid if birthday is not present' do
        new_user = build(:user, birthday: nil)
        expect(new_user).to_not be_valid
      end
    end

    describe 'password' do
      it 'is invalid if <8 or >24 characters long' do
        new_user_short = build(:user, password: "No", password_confirmation: "No")
        new_user_long = build(:user, password: "F" * 25, password_confirmation: "F" * 25)
        expect(new_user_short).to_not be_valid
        expect(new_user_long).to_not be_valid
      end

      it 'is valid if exactly 8 or 24 characters long' do
        new_user_short = build(:user, password: "P" * 8, password_confirmation: "P" * 8)
        new_user_long = build(:user, password: "F" * 24, password_confirmation: "F" * 24)
        expect(new_user_short).to be_valid
        expect(new_user_long).to be_valid
      end
    end
  end

  describe 'associations' do
    it 'responds to the posts association' do
      expect(user).to respond_to(:posts)
    end

    it 'responds to the comments association' do
      expect(user).to respond_to(:comments)
    end

    it 'responds to the profile assocation' do
      expect(user).to respond_to(:profile)
    end
  end

end
