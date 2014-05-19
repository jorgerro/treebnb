require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# u.listings.create!(address_zip_code: Faker::Address.postcode, home_type: "tree_house",
# num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
# num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
# price_per_night: Faker::Number.number(2), address_city: Faker::Address.city)

room_types = ["shared_room", "private_room", "entire_space"]

home_types = ["tree yurt", "tree camp", "tree home", "tree chalet", "tree cottage", "tree hut", "tree lodge", "tree hovel", "tree house"]

lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

def basic_attrs(room_types, home_types, lorem)
  { home_type: home_types.sample, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.sample,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2) }
end

room_attrs = [

  # NORTH AMERICA 0-6

  # https://www.airbnb.com/wishlists/stay-in-a-treehouse/listings/525399
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "north_america",
  street_address: "Dick George Rd." , address_city: "Cave Junction" , address_zip_code: 97523, address_country: "United States" }),

  # title: Artsy and Rustic 1927 tree house
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "north_america",
  street_address: "Loma Lista Pl.", address_city: "Los Angeles", address_zip_code: 90039, address_country: "United States" }),

  #title: White Lotus - Tree House & Skywalk
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "north_america",
  street_address: "Mulberry Drive", address_city: "Standardsville, VA", address_zip_code: 22973, address_country: "United States" }),

  # title: Treehouse in lovely farm setting
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "north_america",
   address_city: "Shelburne Falls, MA", address_zip_code: 01370, address_country: "United States" }),

  # title: Redwood Treehouse Santa Cruz Mtns.
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "north_america",
  street_address: "Vaca Del Sol", address_city: "Watsonville, CA" , address_zip_code: 95076, address_country: "United States" }),

  # title: Treehouse Above San Francisco Bay
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "north_america",
  street_address: "Fey Dr.", address_city: "Burlingame, CA", address_zip_code: 94010, address_country: "United States" }),

  # title: Romantic Garden Treehouse
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "north_america",
  street_address: "Winchester Ln.", address_city: "Schaumberg, IL", address_zip_code: 60193, address_country: "United States" }),

  # EUROPE 7-13

  #title: Tree Sparrow House, Cornwall
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "europe",
  street_address: "Tregaminion", address_city: "St. Keverne",  address_country: "England" }),

  # title: Charming place with mountain view
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "europe",
  street_address: "Calle Señor de la Expiración", address_city: "Lanjaron, Andalusia", address_zip_code: 18420, address_country: "Spain" }),

  # title: UFO Treehouse
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "europe",
   address_city: "Edeforsvag", address_country: "Sweden" }),

  # title: A quiet place in Savoie
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "europe",
  street_address: "Bellecombe-en-Bauges", address_city: "Rhone-Alpes", address_country: "France" }),

  # title: glamping place
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "europe",
  street_address: "Sissinghurst Road", address_city: "Asford",  address_country: "United Kingdom" }),

  # title: Unmissable Magic!
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "europe",
  address_city: "Colmenar, Andalusia", address_zip_code: 29170, address_country: "Spain" }),

  #title:
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "europe",
  address_city: "Nuremberg, Bavaria" , address_zip_code: 90482, address_country: "Germany" }),

  # HAWAII 14-20

  # https://www.airbnb.com/rooms/283017 title: Kealakekua Bay Bali Cottage
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "hawaii",
  street_address: "Kahauloa Road", address_city: "Captain Cook", address_zip_code: 96704, address_country: "United States" }),

  # https://www.airbnb.com/rooms/882199 title: Treehouse just up from the beach
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "hawaii",
  address_city: "Kilauea", address_zip_code: 96754 , address_country: "United States" }),

  # title: sunset beach treehouse bungalow
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "hawaii",
   address_city: "Haleiwa", address_zip_code: 96712, address_country: "United States" }),

  # title: Bali Hut Treehouse
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "hawaii",
  street_address: "Lelani Ave.", address_city: "Pahoa, HI", address_zip_code: 96778, address_country: "United States" }),

  # title: Treehouse at Kilauea Volcano
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "hawaii",
  address_city: "Volcano, HI", address_zip_code: 96785, address_country: "United States" }),

  # title: MangoView Room
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "hawaii",
  street_address: "Kohanaiki", address_city: "Kailua-Kona, HI", address_zip_code: 96740, address_country: "United States" }),

  # title: Chic Eco Yurt Home
  basic_attrs(room_types, home_types, lorem).merge({ address_region: "hawaii",
  street_address: "Lehua Circle", address_city: "Pahoa", address_zip_code: 96778, address_country: "United States" }),

  # EAST ASIA 21-27

  basic_attrs(room_types, home_types, lorem).merge({ address_region: "east_asia",
  address_city: "ByeongJeom", address_country: "South Korea" }),

  basic_attrs(room_types, home_types, lorem).merge({ address_region: "east_asia",
   address_city: "Kyoto",  address_country: "Japan" }),

  basic_attrs(room_types, home_types, lorem).merge({ address_region: "east_asia",
  address_city: "Tokyo",  address_country: "Japan" }),

  basic_attrs(room_types, home_types, lorem).merge({ address_region: "east_asia",
   address_city: "Busan",  address_country: "South Korea" }),

  basic_attrs(room_types, home_types, lorem).merge({ address_region: "east_asia",
   address_city: "Miyajima",  address_country: "Japan" }),

  basic_attrs(room_types, home_types, lorem).merge({ address_region: "east_asia",
   address_city: "Guangzhou",  address_country: "China" }),

  basic_attrs(room_types, home_types, lorem).merge({ address_region: "east_asia",
   address_city: "Suwon",  address_country: "South Korea" }),

   # SOUTH AMERICA 28-34

   basic_attrs(room_types, home_types, lorem).merge({ address_region: "south_america",
   street_address: "", address_city: "Cooper", address_country: "Costa Rica" }),

   basic_attrs(room_types, home_types, lorem).merge({ address_region: "south_america",
   street_address: "", address_city: "Buenos Aires",  address_country: "Argentina" }),

   basic_attrs(room_types, home_types, lorem).merge({ address_region: "south_america",
   street_address: "", address_city: "Bogota",  address_country: "Colombia" }),

   basic_attrs(room_types, home_types, lorem).merge({ address_region: "south_america",
   street_address: "", address_city: "Salvador", address_country: "Brasil" }),

   basic_attrs(room_types, home_types, lorem).merge({ address_region: "south_america",
   street_address: "", address_city: "Caracas",  address_country: "Venezuela" }),

   basic_attrs(room_types, home_types, lorem).merge({ address_region: "south_america",
   street_address: "", address_city: "Belo Horizante" ,  address_country: "Brasil" }),

   basic_attrs(room_types, home_types, lorem).merge({ address_region: "south_america",
   street_address: "", address_city: "Brasilia" ,  address_country: "Brasil" })

]

# 1.times do |x|
#
#   if x == 0
#     u = User.create!(fname: "Jorge", lname: "Rodriguez",
#       email: "jorge@example.com", password: "secret", description: "A pretty chill dude.",
#       avatar: File.open(Rails.root.join("seed_images", "jorge.jpg")))
#   else
#     u = User.create!(fname: Faker::Name.first_name, lname: Faker::Name.last_name,
#     email: Faker::Internet.safe_email, password: "secret", description: lorem)
#   end
#
#   l = u.listings.create!(room_attrs[x])
#
#   l.availabilities.create!(start_date: "2014-05-01", end_date: "2014-05-15")
#   l.availabilities.create!(start_date: "2014-05-17", end_date: "2014-06-30")
#
#   l.pictures.create!(image: File.open(Rails.root.join("seed_images", "treehouse#{x}-a.jpg")))
#   if Rails.root.join("seed_images", "treehouse#{x}-b.jpg").exist?
#     l.pictures.create!(image: File.open(Rails.root.join("seed_images", "treehouse#{x}-b.jpg")))
#   end
#
# end


# u = User.create!(fname: "Demo", lname: "User",
#   email: "demo@example.com", password: "secret", description: "Excited to be part of the treebnb community!",
#   avatar: File.open(Rails.root.join("seed_images", "ewok.jpg")))

  u = User.find(36)
  u.update( avatar: File.open(Rails.root.join("seed_images", "ewok.jpg")) )

l = u.listings.create!(basic_attrs(room_types, home_types, lorem).merge({ title: "Bright Tree Village", address_region: "hawaii",
   address_city: "Mauna Loa",  address_country: "United States" }))

p l.availabilities.create!(start_date: "2014-05-01", end_date: "2014-05-15")
p l.availabilities.create!(start_date: "2014-05-17", end_date: "2014-06-30")

l.pictures.create!(image: File.open(Rails.root.join("seed_images", "treehouse35-a.jpg")))
l.pictures.create!(image: File.open(Rails.root.join("seed_images", "treehouse35-b.jpg")))

Message.create!(sender_id: 1, recipient_id: 36, body: "Welcome to treebnb! Thanks for visiting! Feel free to poke around the
site a bit. I'd recommend exploring the links in the nav bar up top and check out the all Backbone.js Dashboard feature. Enjoy! :)", is_read: false)

Review.create!(author_id: 1, body: "Demo was such a great host! Very considerate and friendly, we were even introduced to some new friends at a
big party towards the end of our stay. Good times!", reviewable_type: "User", reviewable_id: 36)
Review.create!(author_id: 36, body: lorem, reviewable_type: "User", reviewable_id: 1)

Review.create!(author_id: 1, body: lorem, reviewable_type: "Room", reviewable_id: 36)
Review.create!(author_id: 1, body: "Had a fanstastic stay at Bright Tree Village. I thought it would be a bit too cozy at first,
but it turned out to be a blast! Will definitely be back.", reviewable_type: "Room", reviewable_id: 36)

RoomRequest.create!(guest_id: 36, room_id: 1, start_date: "2014-06-02", end_date: "2014-06-08", num_guests: 2, status: "DENIED")
RoomRequest.create!(guest_id: 36, room_id: 1, start_date: "2014-05-20", end_date: "2014-05-27", num_guests: 2, status: "CANCELLED")
RoomRequest.create!(guest_id: 36, room_id: 1, start_date: "2014-05-10", end_date: "2014-05-12", num_guests: 2, status: "PENDING")
RoomRequest.create!(guest_id: 36, room_id: 1, start_date: "2014-05-03", end_date: "2014-05-08", num_guests: 2, status: "APPROVED")

# RoomRequest.create!(guest_id: 1, room_id: 36, start_date: "2014-05-03", end_date: "2014-05-08", num_guests: 2, status: "PENDING")
RoomRequest.create!(guest_id: 1, room_id: 36, start_date: "2014-05-20", end_date: "2014-05-27", num_guests: 2, status: "PENDING")
RoomRequest.create!(guest_id: 1, room_id: 36, start_date: "2014-06-02", end_date: "2014-06-05", num_guests: 2, status: "PENDING")
