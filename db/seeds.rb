# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Animal.destroy_all

puts "seeding the animals"
user = User.create!(email: "yo_mamo@gmail.com", password: 'password')
30.times do
  Animal.create!(
    user: user,
    species: Faker::Creature::Animal.name,
    name: Faker::Creature::Dog.name,
    age: rand(0..27),
    sex: "male",
    location: Faker::Address.street_address,
    price: rand(10..1000),
    rarity_level: "really endangered",
    diet: Faker::Food.ingredient
  )
end
puts "done seeding the #{Animal.count} animals y'all"
