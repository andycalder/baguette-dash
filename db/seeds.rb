# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Creating seeds"

meals = Meal.create(name: 'Frog Sandwich', description: 'Delicious frogs in a french baguette', price: '14,9')
meals = Meal.create(name: 'Snail Platter', description: 'Delicious varieties of snails in a french baguette', price: '40')
meals = Meal.create(name: 'Croque-Monsieur', description: 'Delicious toasted bread with ham and cheese gruyere', price: '15')
meals = Meal.create(name: 'Croque-Madame', description: 'Delicious toasted bread with ham, cheese gruyere and egg', price: '17')

  puts "finished"


