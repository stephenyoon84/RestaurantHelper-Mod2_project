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


stephen = User.create!(name: "Stephen", username: "SS", password: "password", phone_number: 1231231234, role: "Chef")
ammar = User.create!(name: "Ammar", username: "AA", password: "password", phone_number: 2342342345, role: "Admin")
mickey = User.create!(name: "Mickey", username: "MM", password: "password", phone_number: 3453453456)
kelly = User.create!(name: "Kelly", username: "KK", password: "password", phone_number: 4564564567)

#Sushi
tuna_sushi = Menu.create!(name: "Tuna Sushi", price: 4.50, category: "Sushi")
salmon_sushi = Menu.create!(name: "Salmon Sushi", price: 4.25, category: "Sushi")
yellowtail_sushi = Menu.create!(name: "Yellowtail Sushi", price: 3.00, category: "Sushi")
shrimp_sushi = Menu.create!(name: "Shrimp Sushi", price: 3.75, category: "Sushi")
poke = Menu.create!(name: "Poke", price: 8.00, category: "Sushi")
#Noodles
miso_ramen = Menu.create!(name: "Miso Ramen", price: 7.50, category: "Noodles")
tonkotsu_ramen = Menu.create!(name: "Tonkotsu Ramen", price: 7.00, category: "Noodles")
shoyu_ramen = Menu.create!(name: "Shoyu Ramen", price: 6.75, category: "Noodles")
spicy_miso_ramen = Menu.create!(name: "Spicy Miso Ramen", price: 8.00, category: "Noodles")
#Appetizers
edamame = Menu.create!(name: "Edamame", price: 1.50, category: "Appetizers")
wonton_soup = Menu.create!(name: "Wonton Soup", price: 1.75, category: "Appetizers")
tempura = Menu.create!(name: "Tempura", price: 2.00, category: "Appetizers")
shrimp_rangoon = Menu.create!(name: "Shrimp Rangoon", price: 2.50, category: "Appetizers")
#Beverages
sake = Menu.create!(name: "Sake", price: 20.00, category: "Beverages")
ichiban = Menu.create!(name: "Ichiban", price: 5.00, category: "Beverages")
sapporo = Menu.create!(name: "Sapporo", price: 5.50, category: "Beverages")
mango_ramune = Menu.create!(name: "Mango Ramune", price: 1.50, category: "Beverages")
strawberry_ramune = Menu.create!(name: "Strawberry Ramune", price: 1.50, category: "Beverages")
lychee_ramune = Menu.create!(name: "Lychee Ramune", price: 1.50, category: "Beverages")



test_order = Cart.create!(user: stephen, menu: tuna_sushi)
test_order2 = Cart.create!(user: stephen, menu: yellowtail_sushi)
