require 'faker'
require 'open-uri'
Bar.destroy_all
User.destroy_all
User.create!({
  email: "test@email.com",
  password: "123456"
})
5.times do
  bars = Bar.new(
    name: Faker::Artist.name,
    description: Faker::Quote.famous_last_words,
    status: :many_spaces,
    category: BAR_CATEGORIES.sample,
    address: Faker::Address.full_address,
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    )
    photos = []
    photo = URI.open('https://images.unsplash.com/photo-1572116469696-31de0f17cc34?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80')
    photo_1 = URI.open('https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80')
    photo_2 = URI.open('https://images.unsplash.com/photo-1575444758702-4a6b9222336e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80')
    
    photos << photo
    photos << photo_1
    photos << photo_2
    photos.each do |photo|
      bars.photos.attach(io: photo, filename: 'buddy-avatar.png')
    end
    bars.save!
    puts "Finish seeding and created #{User.count} user & #{Bar.count} bars"
  end