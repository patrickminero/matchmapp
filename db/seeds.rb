require 'faker'
require 'open-uri'
require 'httparty'

Bar.destroy_all
puts "Destroyed existing bars."
User.destroy_all
puts "Destroyed existing users."
Match.destroy_all
puts "Destroyed existing matches."

puts "Performing background job to import matches."
LatestGamesJob.perform_now

User.create!({
  email: "andrea@email.com",
  password: "123456",
  name: "Andrea R",
  admin: true
})
User.create!({
  email: "patrick@email.com",
  password: "123456",
  name: "Patrick M"
})
User.create!({
  email: "adrian@email.com",
  password: "123456",
  name: "Adrian D"
})

puts "Finish seeding and created #{User.count} users"

response = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=%22Sports%20Bars%22&location=%22barcelona%22", {headers: {Authorization: "Bearer #{ENV['API_KEY']}"}})
response["businesses"].each do |b|
  categories = b["categories"].map { |category| category["title"]}
  if categories.any? { |c| BAR_CATEGORIES.include?(c) }
    bar = Bar.create!( 
      name: b["name"],
      description: Faker::Restaurant.description,
      status: :many_spaces,
      category: categories.select { |c| BAR_CATEGORIES.include?(c) }[0],
      address: "#{b["location"]["display_address"][0]},#{b["location"]["display_address"][1]},#{b["location"]["display_address"][2]}"
    )

    photos = URI.open(b["image_url"])
    bar.photos.attach(io: photos, filename: 'bar-photo.png')
    puts "Finished creating #{Bar.count} bars."
  end
end

  bars = Bar.all

  Match.all.each do |match|
    10.times do
      match.bars.push(bars.where.not(id: match.bars.pluck(:id)).sample)
    end
  end

  puts "Finished creating #{Match.count} screenings."