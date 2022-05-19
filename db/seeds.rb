# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

Booking.destroy_all
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

images = { 'Anaconda' => (1..3).to_a, 'Elephant' => (1..3).to_a, 'Komodo' => (1..3).to_a, 'Snow_Leopard' => (1..3).to_a, 'Trex' => (1..3).to_a }
locations = %w(Miami Tokyo Osaka Kyoto Paris Sapporo London Naha Kumamoto Shinjuku Meguro Kasukabe Omiya Ikeburo Arakawa Toshima Yokohama Chiba Saitama)
images.each do |animal, file_names|
  file_names.each do |file_name|
   new_animal = Animal.create!(
     user: user.sample,
     species: animal,
     name: Faker::Creature::Dog.name,
     age: rand(0..100),
     sex: rand(0..2),
     location: locations.sample,
     price: rand(10..1000),
     rarity_level: rand(0..2),
     diet: rand(0..5)
    )
    file = File.open("app/assets/images/#{animal}/#{file_name}.jpeg")
    new_animal.photo.attach(io: file, filename: 'animal.jpg', content_type: 'image/jpg')
  end
end


puts "done seeding the #{Animal.count} animals y\'all"
