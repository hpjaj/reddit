require 'faker'

# Unique Post
if !Post.exists?(title: '12345', body: '678910')
  Post.create!(title: '12345', body: '678910')
end
unique_post = Post.find_by(title: '12345', body: '678910')

# Unique Comment
if !Comment.exists?(post: unique_post, body: '112233')
  Comment.create!(post: unique_post, body: '112233')
end

# Create Posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
100.times do 
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

# Create Advertisements
50.times do 
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy:  Faker::Lorem.paragraph,
    price: Faker::Number.digit.to_i
  )
end
advertisements = Advertisement.all

puts 'Seed finished'
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"