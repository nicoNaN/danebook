require 'rails_helper'

describe Profile do
  let(:profile){ build(:profile) }

  describe 'phone number validation' do
    it 'fails when not given a number' do
      new_profile = build(:profile, phone_number: "fail")
      expect(new_profile).to_not be_valid
    end

    it 'is invalid if <10 characters long' do
      new_profile_short = build(:profile, phone_number: "1" * 9)
      expect(new_profile_short).to_not be_valid
    end

    it 'is invalid if >15 characters long' do
      new_profile_long = build(:profile, phone_number: "1" * 16)
      expect(new_profile_long).to_not be_valid
    end

    it 'is valid if exactly 10 characters long' do
      new_profile_short = build(:profile, phone_number: "1" * 10)
      expect(new_profile_short).to be_valid
    end

    it 'is valid if exactly 15 characters long' do
      new_profile_long = build(:profile, phone_number: "1" * 15)
      expect(new_profile_long).to be_valid
    end
  end

  describe 'association' do
    it 'responds to the user association' do
      expect(profile).to respond_to(:user)
    end
  end
end
