require 'faker'
require 'open-uri'
Bar.destroy_all
User.destroy_all
User.create!({
  email: "test@email.com",
  password: "123456"
})

5.times do |i|
  matches = Match.new(
    unique_event_id: i,
    home_team: Faker::Sports::Football.team,
    away_team: Faker::Sports::Football.team,
    league: Faker::Sports::Football.competition.upcase!,
    sports: SPORT_CATEGORY.sample,
    date: Time.now + 15000
    )
  puts "Finish seeding and created #{Match.count}"
  matches.save!
end

first_bar = Bar.create(
  name: "Flaherty´s Irish Pub",
  description: "Lip-smacking pub grub and a range of alcohol make Flaherty’s a close second to being in the stadium.",
  status: :many_spaces,
  category: 'Irish bar',
  address:  'Plaça de Joaquim Xirau, s/n, 08002 Barcelona',
  latitude: 41.37870164483642,
  longitude: 2.176786126104934
)

second_bar = Bar.create(
  name: "Belushi's Barcelona",
  description: "Informal chain bar with TV sport and live entertainment",
  status: :many_spaces,
  category: 'Sports bar',
  address: 'Carrer de Bergara, 3, 08002 Barcelona',
  latitude: 41.386358715402245,
  longitude: 2.1676741684331424
)

third_bar = Bar.create(
  name:"The Wild Rover",
  description: "We are a premium Barcelona Sports Bar. We show all sports live on our two of the biggest HD screens and on six other TV’s",
  status: :many_spaces,
  category: 'Irish bar',
  address: 'Carrer de Santa Mònica, 2, 08001 Barcelona',
  latitude: 41.37772324519451,
  longitude: 2.1753559107606577
)

fourth_bar = Bar.create(
  name: 'CocoVail Beer Hall',
  description:"Over 20 craft beers on tap, multiple TV sets with Red Zone and some great wings.",
  status: :many_spaces,
  category: 'Sports bar',
  address: "C/ d'Aragó, 284, 08009 Barcelona",
  latitude: 41.39293183542706,
  longitude: 2.165815712613711
)

fifth_bar = Bar.create(
  name:'Obama English Pub',
  description: 'We broadcast all the La Liga football matches along with other games from other european competitions.',
  status: :many_spaces,
  category: 'Sports bar',
  address: 'Gran Via de les Corts Catalanes, 603, 08007 Barcelona',
  latitude: 41.38909990716811,
  longitude: 2.1671547702856873
)

  photos = [URI.open('https://images.unsplash.com/photo-1572116469696-31de0f17cc34?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80'),
  URI.open('https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80'),
  URI.open('https://images.unsplash.com/photo-1575444758702-4a6b9222336e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'),
  URI.open('https://i.pinimg.com/564x/f9/5b/84/f95b84d28f8add4e0bd8598fbdd37b7b.jpg'),
  URI.open('https://i.pinimg.com/564x/66/e5/93/66e593ee6dc9908923e56774077641ce.jpg'),
  URI.open('https://i.pinimg.com/564x/e1/41/e2/e141e27b471274e066934b7ba865e82c.jpg'),
  URI.open('https://images.unsplash.com/photo-1538488881038-e252a119ace7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
  URI.open('https://i.pinimg.com/564x/4f/01/49/4f014969d7b7c8ca4de935684be21e52.jpg'),
  URI.open('https://i.pinimg.com/564x/75/8c/62/758c62f9f9835ddd05f6e1a5818732c7.jpg'),
  URI.open('https://i.pinimg.com/564x/fb/f3/dd/fbf3dd57f9c5f6b39e49e16ad2d5d759.jpg'),
  URI.open('https://i.pinimg.com/564x/9c/ff/fb/9cfffbd6050241b124ba985ee6c36795.jpg'),
  URI.open('https://images.unsplash.com/photo-1541388320452-cb41172bb7ca?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
  URI.open('https://images.unsplash.com/photo-1564590548506-20339c0057b1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80'),
  URI.open('https://i.pinimg.com/564x/26/52/a1/2652a1e8edc4ce8a6674d8f0646e34d6.jpg'),
  URI.open('https://i.pinimg.com/564x/0c/65/8f/0c658f019ff7decaad91ec016924675c.jpg')]

    
  Bar.all.each_with_index do |bar, index|
    bar.photos.attach(io: photos[index], filename: 'buddy-avatar.png')
    bar.matches.push(Match.all.sample)
  end

  puts "Finish seeding and created #{User.count} user & #{Bar.count} bars"
