# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'Lolo', email: 'lolo@mail.ru', password: 'qweqwe', password_confirmation: 'qweqwe')
User.create!(name: 'Pepe', email: 'pepe@mail.ru', password: 'qweqwe', password_confirmation: 'qweqwe')
User.create!(name: 'Admin', email: 'admin@mail.ru', password: 'qweqwe', password_confirmation: 'qweqwe', admin: true)
Place.create!(name: "Drakon", desc: "nice place", image: Faker::Company.logo)
Dish.create!(name: "Plov", desc: "nice dish", price: '100', place_id: Place.last.id)
