User.destroy_all
Post.destroy_all

30.times do
  u = User.new
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = Faker::Internet.email
  u.birthday = rand(-200..200).days.ago
  u.gender = ['1','2','3'].sample
  u.password = "ayy_lmao"
  u.password_confirmation = "ayy_lmao"
  u.save!
end

User.all.each do |user|
  Profile.create(
    user_id: user.id,
    college: Faker::Lorem.word.capitalize + ' University',
    hometown: Faker::Address.city + ', ' + Faker::Address.state_abbr,
    residence: Faker::Address.city + ', ' + Faker::Address.state_abbr,
    phone_number: Faker::Number.number(10),
    quotes: Faker::Lorem.sentence,
    about: Faker::Lorem.paragraph
  )
  10.times do
    Post.create(
      user_id: user.id,
      content: Faker::Lorem.paragraph
    )
  end
end
