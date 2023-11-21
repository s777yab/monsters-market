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

puts "🧼🧼🧼Cleaning the databse🧼🧼🧼"
Monster.destroy_all
User.destroy_all


puts "👾👾👾 Creatting users, bookings and monsters 👾👾👾"

species = ["water", "earth", "ghost", "fire"]

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "Password1234"
  )

  monster = Monster.new(
    name: Faker::Games::Pokemon.name,
    species: species.sample,
    ability: Faker::Games::Pokemon.move,
    price: (100..1000).to_a.sample,
    address: Faker::Address.city
  )

  user.save
  monster.user = user
  monster.save
end

users = User.all
monsters = Monster.all

10.times do
  booking = Booking.new(
    start_date: Date.today,
    end_date: Date.today + 1
  )

  booking.user = users.sample
  booking.monster = monsters.sample
  booking.save
end

puts "🎉!!!FINITO BOYS!!!🎉"
