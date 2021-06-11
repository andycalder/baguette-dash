# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

julia = User.create!(first_name: 'Julia', last_name: 'Noiret', email: 'julia.noiret@gmail.com', password: 'secret')
jorge = User.create!(first_name: 'Jorge', last_name: 'Arias', email: 'jorgeariasgil@gmail.com', password: 'secret')
hong = User.create!(first_name: 'Hongleang', last_name: 'Lim', email: 'lim.hongleang@gmail.com', password: 'secret')
andrew = User.create!(first_name: 'Andrew', last_name: 'Calder', email: 'andrew.calder@gmail.com', password: 'secret')
noir = User.create!(first_name: 'Restaurant', last_name: 'Noir', email: 'restaurant_noir@fakemail.com', password: 'secret')
france = User.create!(first_name: 'Restaurant', last_name: 'France', email: 'restaurant_france@fakemail.com', password: 'secret')
