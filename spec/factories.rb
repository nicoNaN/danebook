FactoryGirl.define do  factory :photo do
    
  end
  factory :friendship do
    
  end

  factory :user do
    sequence(:first_name){ |n| "Test#{n}" }
    sequence(:last_name){ |n| "User#{n}" }
    email { "#{first_name}" + "#{last_name}" + "@example.com" }
    birthday Time.now
    gender ['1','2','3'].sample
    password "ayy_lmao"
    password_confirmation "ayy_lmao"
    after(:create) do |u|
      create_list(:profile, 1, user: u)
      create_list(:post, 1, user: u)
    end
  end

  factory :profile do
    college Faker::Lorem.word.capitalize + ' University'
    hometown Faker::Address.city + ', ' + Faker::Address.state_abbr
    residence Faker::Address.city + ', ' + Faker::Address.state_abbr
    phone_number Faker::Number.number(10)
    quotes Faker::Lorem.sentence
    about Faker::Lorem.paragraph
    association :user, factory: :user
  end

  factory :post do
    content Faker::Lorem.paragraph
    association :user, factory: :user
  end

  factory :comment do
    content Faker::Lorem.sentence
    association :user, factory: :user
  end
end
