User.destroy_all
Post.destroy_all
Comment.destroy_all
Friendship.destroy_all

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
      content: Faker::Lorem.paragraph,
      created_at: (rand*10).days.ago
    )
  end

   chosen_friend_ids = []

  5.times do
    new_friend_id = User.all.sample.id
    until !chosen_friend_ids.include?(new_friend_id)
      new_friend_id = User.all.sample.id
    end
    Friendship.create(
      user_id: user.id,
      friend_id: new_friend_id
    )

    chosen_friend_ids << new_friend_id
  end
end

500.times do
  type = ['Post', 'Comment'].sample

  like = Like.new
  like.user_id = User.all.sample.id
  like.likable_id = type.constantize.pluck(:id).sample
  like.likable_type = type
  like.save!
end

300.times do
  user = User.all.sample
  post = Post.all.sample
  Comment.create(
    user_id: user.id,
    post_id: post.id,
    content: Faker::Lorem.sentence
  )
end
