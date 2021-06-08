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

baguette = Meal.create!(name: 'Baguette', description: 'A really delicious baguette from Almost French Patisserie', price: 10, user: julia)
croissant = Meal.create!(name: 'Croissant', description: 'A really delicious croissant from Hongs French restaurant', price: 5, user: hong)

Order.create!(user: jorge, meal: baguette, price: 10, status: 'pending')

