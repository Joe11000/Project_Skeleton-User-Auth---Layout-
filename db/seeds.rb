require 'faker'

'a'.upto('j') do |name|
  new_category = Category.create(title: name * 2, creator_email: name * 5 + "@gmail.com")

  10.times do |post|
    post = Post.create(category_id: new_category.id, email: Faker::Internet.email, 
                location: Faker::Address.city, text: Faker::Lorem.sentence)
    puts post.errors.full_messages
  end   
end    
