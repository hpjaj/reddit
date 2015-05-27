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

puts 'Seed finished'
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"