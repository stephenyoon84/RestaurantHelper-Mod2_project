# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cart.delete_all
User.delete_all
Menu.delete_all


stephen = User.create!(name: "Stephen", username: "SS", password: "password")
ammar = User.create!(name: "Ammar", username: "AA", password: "password")
mickey = User.create!(name: "Mickey", username: "MM", password: "password")
kelly = User.create!(name: "Kelly", username: "KK", password: "password")


sushi = Menu.create!(name: "Sushi", price: 10.00)
ramen = Menu.create!(name: "Ramen", price: 4.00)
poke = Menu.create!(name: "Poke", price: 8.00)
sake = Menu.create!(name: "Sake", price: 20.00)
edamame = Menu.create!(name: "Edamame", price: 1.50)

test_order = Cart.create!(user_id: 1, menu_id: 1)
