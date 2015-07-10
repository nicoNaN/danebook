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

  factory :post do
    content Faker::Lorem.paragraph
    association :user, factory: :user
  end

  factory :comment do
    content Faker::Lorem.sentence
    association :post, factory: :post
    association :user, factory: :user
  end
end
