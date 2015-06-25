User.destroy_all

30.times do
  u = User.new
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = Faker::Internet.email
  u.password = "ayy_lmao"
  u.password_confirmation = "ayy_lmao"
  u.save!
end
