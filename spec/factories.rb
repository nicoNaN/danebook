FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    birthday Time.now
    gender ['1','2','3'].sample
    password "ayy_lmao"
    password_confirmation "ayy_lmao"
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
