# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Animal.destroy_all
User.destroy_all
User.create!(email: "dvnchong@gmail.com", password: '123456', first_name: 'Devin', last_name: 'Chong')
User.create!(email: "azatallayarow@gmail.com", password: '123456', first_name: 'Azat', last_name: 'Allayarov')
User.create!(email: "kylejwthomas@gmail.com ", password: '123456', first_name: 'Kyle', last_name: 'Thomas')
puts "creating users with default password '123456'"
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456'
  )
end
puts "there are now #{User.count} users (including Azat, Devin, and Kyle) with DEFAULT PASSWORD '123456'"

puts "seeding the animals"
user = User.all
10.times do
  Animal.create!(
    user: user.sample,
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
puts "done seeding the #{Animal.count} animals y\'all"
