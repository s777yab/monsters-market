# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
require 'date'
require 'open-uri'

puts "🧼🧼🧼Cleaning the databse🧼🧼🧼"
Monster.destroy_all
User.destroy_all
Booking.destroy_all

puts "👾👾👾 Creatting users, bookings and monsters 👾👾👾"

species = ["water", "earth", "ghost", "fire"]

puts "Creating users"
sayyab = User.create(
  email: 'sayyab@gmail.com',
  password: "123456",
  address: "New York",
  first_name: "Sayyab",
  last_name: "Khan",
  username: "sayyabK"
)

tony = User.create(
  email: 'tony@gmail.com',
  password: "123456",
  address: "London",
  first_name: "Tony",
  last_name: "Masek",
  username: "tonyM"
)

alan = User.create(
  email: 'alan@gmail.com',
  password: "123456",
  address: "London",
  first_name: "Alan",
  last_name: "Miller",
  username: "alanM"
)

User.create(
  email: 'marco@gmail.com',
  password: "123456",
  address: "Barcelona",
  first_name: "Marco",
  last_name: "Di Leo",
  username: "marcoDL"
)

User.create(
  email: 'howard@gmail.com',
  password: '123456',
  address: "Prague",
  first_name: "Howard",
  last_name: "Thompson",
  username: "howardT"
)

puts "Creating monsters"
monster1 = Monster.new(
  name: Faker::Games::Pokemon.name,
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: "Brooklyn",
  user: sayyab
)
file = URI.open("https://i.kym-cdn.com/entries/icons/original/000/045/150/lopunny.jpg")
monster1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster1.save!

monster2 = Monster.new(
  name: Faker::Games::Pokemon.name,
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: 'Manhattan',
  user: sayyab
)
file = URI.open("https://media.cnn.com/api/v1/images/stellar/prod/210226040722-01-pokemon-anniversary-design.jpg?q=w_1920,h_1080,x_0,y_0,c_fill")
monster2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster2.save!

monster3 = Monster.new(
  name: Faker::Games::Pokemon.name,
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: 'La Barceloneta',
  user: sayyab
)
file = URI.open("https://i.pinimg.com/736x/ec/85/ba/ec85ba62cdcbcae1b9fb996f40bb2d0a.jpg")
monster3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster3.save!

monster4 = Monster.new(
  name: Faker::Games::Pokemon.name,
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: 'London EC1Y 1BE',
  user: tony
)
file = URI.open("https://static.wikia.nocookie.net/pyruslords/images/2/21/Froakie.jpg/revision/latest?cb=20140104013253")
monster4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster4.save!

monster5 = Monster.new(
  name: Faker::Games::Pokemon.name,
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: 'Kingston, London',
  user: tony
)
file = URI.open("https://img.pokemondb.net/artwork/large/basculegion-male.jpg")
monster5.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster5.save!

monster6 = Monster.new(
  name: Faker::Games::Pokemon.name,
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: 'Hoxton, London',
  user: tony
)
file = URI.open("https://i.pinimg.com/originals/ca/f8/79/caf8795dd669f4d3271ef6b1fd17c9a2.jpg")
monster6.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster6.save!

monster7 = Monster.new(
  name: Faker::Games::Pokemon.name,
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: 'Chelsea, London',
  user: tony
)
file = URI.open("https://static.wikia.nocookie.net/sonicpokemon/images/1/1f/Magikarp_AG_anime.png/revision/latest?cb=20130520060359")
monster7.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster7.save!

monster8 = Monster.new(
  name: Faker::Games::Pokemon.name,
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: 'Zizkov, Prague',
  user: sayyab
)
file = URI.open("https://imageio.forbes.com/blogs-images/olliebarder/files/2018/06/pokeball_mew-1200x675.jpg?format=jpg&height=900&width=1600&fit=bounds")
monster8.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster8.save!

monster9 = Monster.new(
  name: Faker::Games::Pokemon.name,
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: 'Bousova, Prague',
  user: sayyab
)
file = URI.open("https://miro.medium.com/v2/resize:fit:302/1*KuSu6ZTyLAcRDwOsI9ZzZA.png")
monster9.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster9.save!

monster10 = Monster.new(
  name: Faker::Games::Pokemon.name,
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: 'Namesti Republiky, Prague',
  user: tony
)
file = URI.open("https://imageio.forbes.com/blogs-images/olliebarder/files/2018/06/pokeball_mew-1200x675.jpg?format=jpg&height=900&width=1600&fit=bounds")
monster10.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster10.save!

monster11 = Monster.new(
  name: "Booked monster!",
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: 'London',
  user: tony
)
file = URI.open("https://imageio.forbes.com/blogs-images/olliebarder/files/2018/06/pokeball_mew-1200x675.jpg?format=jpg&height=900&width=1600&fit=bounds")
monster11.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster11.save!

monster12 = Monster.new(
  name: Faker::Games::Pokemon.name,
  species: species.sample,
  ability: Faker::Games::Pokemon.move,
  price: (100..1000).to_a.sample,
  address: 'Hoxton, London',
  user: alan
)
file = URI.open("https://imageio.forbes.com/blogs-images/olliebarder/files/2018/06/pokeball_mew-1200x675.jpg?format=jpg&height=900&width=1600&fit=bounds")
monster12.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
monster12.save!

Monster.update_all(bookable: true)

puts "Creating bookings"

booking = Booking.new(
  start_date: Date.today,
  end_date: Date.today + 1,
  active: true
)

booking.user = alan
booking.monster = monster11
monster11.update(bookable: false)
booking.save!

puts "🎉!!!FINITO BOYS!!!🎉"
