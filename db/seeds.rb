# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

room_types = ["shared_room", "private_room", "entire_space"]

home_types = ["yurt", "camp", "chalet", "cottage", "hut", "lodge","shack", "shanty","shed", "hovel", "deckhouse"]

100.times do |x|

  u = User.create!(fname: Faker::Name.first_name, lname: Faker::Name.last_name,
  email: Faker::Internet.safe_email, password: "secret", description: Faker::Lorem.sentence(4))

  u.listings.create!(address_zip_code: Faker::Address.postcode, home_type: "tree_house",
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_city: Faker::Address.city)

end
