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
    photo = URI.open('https://picsum.photos/200/300')
    photo_1 = URI.open('https://picsum.photos/200/300')
    photo_2 = URI.open('https://picsum.photos/200/300')
    
    photos << photo
    photos << photo_1
    photos << photo_2
    photos.each do |photo|
      bars.photos.attach(io: photo, filename: 'buddy-avatar.png')
    end
    bars.save!
    puts "Finish seeding and created #{User.count} user & #{Bar.count} bars"
  end