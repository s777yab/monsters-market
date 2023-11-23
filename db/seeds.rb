require 'faker'
require 'date'
require 'open-uri'

user_details = [
  {
    email: 'sayyab@gmail.com',
    password: "123456",
    address: "New York",
    first_name: "Sayyab",
    last_name: "Khan",
    username: "sayyab"
  },
  {
    email: 'tony@gmail.com',
    password: "123456",
    address: "London",
    first_name: "Tony",
    last_name: "Masek",
    username: "tonyM"
  },
  {
    email: 'alan@gmail.com',
    password: "123456",
    address: "London",
    first_name: "Alan",
    last_name: "Miller",
    username: "alanM"
  },
  {
    email: 'marco@gmail.com',
    password: "123456",
    address: "Berlin",
    first_name: "Marco",
    last_name: "Di Leo",
    username: "marcoDL"
  },
  {
    email: 'howard@gmail.com',
    password: '123456',
    address: "Prague",
    first_name: "Howard",
    last_name: "Thompson",
    username: "howardT"
  }
]

monster_addresses = [
  "Alexander Road, London",
  "Stanley Road, London",
  "Kings Road, London",
  "Windsor Road, London",
  "The Green, London",
  "Victoria Street, London",

  "Queens Road, London",
  "Manor Road, London",
  "York Road, London",
  "North Road, London",
  "Broadway, London",
  "Victoria Road, London",

  "Namesti Republiky, Prague",
  "Zizkov, Prague",
  "Smichov, Prague",
  "Karlin, Prague",
  "Podoli, Prague",
  "Narodni Trida, Prague",

  "Pinehurst Ave, New York",
  "Central, Park New York",
  "Manhattan, New York",
  "Brooklyn, New York",
  "Queens, New York",
  "Fleetwood, New York",

  "Kreuzberg, Berlin",
  "Mitte, Berlin",
  "Moabit, Berlin",
  "Wittenau, Berlin",
  "Pankow, Berlin",
  "Tegel, Berlin"
]

picture_urls = [
  "https://i.kym-cdn.com/entries/icons/original/000/045/150/lopunny.jpg",
  "https://media.cnn.com/api/v1/images/stellar/prod/210226040722-01-pokemon-anniversary-design.jpg?q=w_1920,h_1080,x_0,y_0,c_fill",
  "https://i.pinimg.com/736x/ec/85/ba/ec85ba62cdcbcae1b9fb996f40bb2d0a.jpg",
  "https://static.wikia.nocookie.net/pyruslords/images/2/21/Froakie.jpg/revision/latest?cb=20140104013253",
  "https://img.pokemondb.net/artwork/large/basculegion-male.jpg",
  "https://i.pinimg.com/originals/ca/f8/79/caf8795dd669f4d3271ef6b1fd17c9a2.jpg",
  "https://static.wikia.nocookie.net/sonicpokemon/images/1/1f/Magikarp_AG_anime.png/revision/latest?cb=20130520060359",
  "https://imageio.forbes.com/blogs-images/olliebarder/files/2018/06/pokeball_mew-1200x675.jpg?format=jpg&height=900&width=1600&fit=bounds",
  "https://miro.medium.com/v2/resize:fit:302/1*KuSu6ZTyLAcRDwOsI9ZzZA.png",
  "https://imageio.forbes.com/blogs-images/olliebarder/files/2018/06/pokeball_mew-1200x675.jpg?format=jpg&height=900&width=1600&fit=bounds",
  "https://imageio.forbes.com/blogs-images/olliebarder/files/2018/06/pokeball_mew-1200x675.jpg?format=jpg&height=900&width=1600&fit=bounds",
  "https://imageio.forbes.com/blogs-images/olliebarder/files/2018/06/pokeball_mew-1200x675.jpg?format=jpg&height=900&width=1600&fit=bounds"
]

species = ["water", "earth", "ghost", "fire"]


puts "🧼🧼🧼 Cleaning the database 🧼🧼🧼"

Monster.destroy_all
User.destroy_all
Booking.destroy_all

puts "🧍🧍🧍 Creating users 🧍🧍🧍"

users = user_details.map do |details|
  User.create(details)
end

puts "👾👾👾 Creating monsters 👾👾👾"

def build_monster(species, monster_addresses, users, picture_urls)
  monster = Monster.new(
    name: Faker::Games::Pokemon.name,
    species: species.sample,
    ability: Faker::Games::Pokemon.move,
    price: (100..1000).to_a.sample,
    address: monster_addresses.last,
    user: users.sample
  )
  monster.photo.attach(io: URI.open(picture_urls.sample), filename: "nes.png", content_type: "image/png")
  monster.save!
end

30.times do
  build_monster(species, monster_addresses, users, picture_urls)
  monster_addresses.pop
end

Monster.update_all(bookable: true)

puts "📚📚📚 Creating bookings 📚📚📚"

booking = Booking.new(
  start_date: Date.today,
  end_date: Date.today + 1,
  active: true
)

booking.user = users.first
booking.monster = Monster.where.not(user_id: booking.user.id).sample
Monster.last.update(bookable: false)
booking.save!

puts "🎉🎉🎉 FINITO BOYS 🎉🎉🎉"
