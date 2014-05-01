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

image_urls = [
  "http://www.boredpanda.com/blog/wp-content/plugins/copyrightWrapper/watermark.php?display=true&image=http://bp.uuuploads.com/amazing-treehouses/amazing-treehouses-10.jpg",
  "http://www.boredpanda.com/blog/wp-content/plugins/copyrightWrapper/watermark.php?display=true&image=http://bp3.uuuploads.com/amazing-treehouses/amazing-treehouses-16.jpg",
  "http://www.boredpanda.com/blog/wp-content/plugins/copyrightWrapper/watermark.php?display=true&image=http://bp.uuuploads.com/amazing-treehouses/amazing-treehouses-7.jpg",
  "http://www.boredpanda.com/blog/wp-content/plugins/copyrightWrapper/watermark.php?display=true&image=http://bp3.uuuploads.com/amazing-treehouses/amazing-treehouses-6.jpg",
  "http://www.boredpanda.com/blog/wp-content/plugins/copyrightWrapper/watermark.php?display=true&image=http://bp2.uuuploads.com/amazing-treehouses/amazing-treehouses-5.jpg",
  "http://www.boredpanda.com/blog/wp-content/plugins/copyrightWrapper/watermark.php?display=true&image=http://bp.uuuploads.com/amazing-treehouses/amazing-treehouses-3.jpg",
  "http://www.boredpanda.com/blog/wp-content/plugins/copyrightWrapper/watermark.php?display=true&image=http://bp3.uuuploads.com/amazing-treehouses/amazing-treehouses-13.jpg",
  "https://s3.amazonaws.com/freebnb_dev/resized_treehouses/amazing-treehouses-17.jpg",
  "https://s3.amazonaws.com/freebnb_dev/resized_treehouses/amazing-treehouses-2.jpg",
  "https://s3.amazonaws.com/freebnb_dev/resized_treehouses/amazing-treehouses-4.jpg",
  "http://follyfancier.files.wordpress.com/2012/03/fujimori-treehouse.jpg",
  "http://inspir3d.net/wp-content/uploads/2011/11/tree10.jpg",
  "http://www.treehotel.se/_files/_filhanterare/Bildspel_i_sidan/Stora/Cabin//182_cabin_exterior_7a.jpg"
]

room_types = ["shared_room", "private_room", "entire_space"]

home_types = ["tree yurt", "tree camp", "tree home", "tree chalet", "tree cottage", "tree hut", "tree lodge", "tree hovel", "tree house"]

lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

room_attrs = [

  # SOUTH AMERICA 0-6


  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "south_america",
  street_address: "", address_city: "Cooper", address_country: "Costa Rica" },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "south_america",
  street_address: "", address_city: "Buenos Aires",  address_country: "Argentina" },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "south_america",
  street_address: "", address_city: "Bogota",  address_country: "Colombia" },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "south_america",
  street_address: "", address_city: "Salvador", address_country: "Brasil" },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "south_america",
  street_address: "", address_city: "Caracas",  address_country: "Venezuela" },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "south_america",
  street_address: "", address_city: "Belo Horizante" ,  address_country: "Brasil" },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "south_america",
  street_address: "", address_city: "Brasilia" ,  address_country: "Brasil" },


  # NORTH AMERICA 7-13

  # https://www.airbnb.com/wishlists/stay-in-a-treehouse/listings/525399
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "north_america",
  street_address: "Dick George Rd." , address_city: "Cave Junction" , address_zip_code: 97523, address_country: "United States"},

  # title: Artsy and Rustic 1927 tree house
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "north_america",
  street_address: "Loma Lista Pl.", address_city: "Los Angeles", address_zip_code: 90039, address_country: "United States"  },

  #title: White Lotus - Tree House & Skywalk
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "north_america",
  street_address: "Mulberry Drive", address_city: "Standardsville, VA", address_zip_code: 22973, address_country: "United States"  },

  # title: Treehouse in lovely farm setting
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "north_america",
   address_city: "Shelburne Falls, MA", address_zip_code: 01370, address_country: "United States"  },

  # title: Redwood Treehouse Santa Cruz Mtns.
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "north_america",
  street_address: "Vaca Del Sol", address_city: "Watsonville, CA" , address_zip_code: 95076, address_country: "United States"  },

  # title: Treehouse Above San Francisco Bay
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "north_america",
  street_address: "Fey Dr.", address_city: "Burlingame, CA", address_zip_code: 94010, address_country: "United States"  },

  # title: Romantic Garden Treehouse
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "north_america",
  street_address: "Winchester Ln.", address_city: "Schaumberg, IL", address_zip_code: 60193, address_country: "United States"  },

  # EUROPE 14-20

  #title: Tree Sparrow House, Cornwall
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "europe",
  street_address: "Tregaminion", address_city: "St. Keverne",  address_country: "England" },

  # title: Charming place with mountain view
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "europe",
  street_address: "Calle Señor de la Expiración", address_city: "Lanjaron, Andalusia", address_zip_code: 18420, address_country: "Spain"  },

  # title: UFO Treehouse
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "europe",
   address_city: "Edeforsvag", address_country: "Sweden"  },

  # title: A quiet place in Savoie
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "europe",
  street_address: "Bellecombe-en-Bauges", address_city: "Rhone-Alpes", address_country: "France"  },

  # title: glamping place
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "europe",
  street_address: "Sissinghurst Road", address_city: "Asford",  address_country: "United Kingdom"  },

  # title: Unmissable Magic!
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "europe",
  address_city: "Colmenar, Andalusia", address_zip_code: 29170, address_country: "Spain"  },

  #title:
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "europe",
  address_city: "Nuremberg, Bavaria" , address_zip_code: 90482, address_country: "Germany"  },

  # HAWAII 21-27

  # https://www.airbnb.com/rooms/283017 title: Kealakekua Bay Bali Cottage
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "hawaii",
  street_address: "Kahauloa Road", address_city: "Captain Cook", address_zip_code: 96704, address_country: "United States"  },

  # https://www.airbnb.com/rooms/882199 title: Treehouse just up from the beach
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "hawaii",
  address_city: "Kilauea", address_zip_code: 96754 , address_country: "United States"  },

  # title: sunset beach treehouse bungalow
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "hawaii",
   address_city: "Haleiwa", address_zip_code: 96712, address_country: "United States"  },

  # title: Bali Hut Treehouse
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "hawaii",
  street_address: "Lelani Ave.", address_city: "Pahoa, HI", address_zip_code: 96778, address_country: "United States"  },

  # title: Treehouse at Kilauea Volcano
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "hawaii",
  address_city: "Volcano, HI", address_zip_code: 96785, address_country: "United States"  },

  # title: MangoView Room
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "hawaii",
  street_address: "Kohanaiki", address_city: "Kailua-Kona, HI", address_zip_code: 96740, address_country: "United States"  },

  # title: Chic Eco Yurt Home
  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "hawaii",
  street_address: "Lehua Circle", address_city: "Pahoa", address_zip_code: 96778, address_country: "United States"  },

  # EAST ASIA 28-34

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "east_asia",
  address_city: "ByeongJeom", address_country: "South Korea"  },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "east_asia",
   address_city: "Kyoto",  address_country: "Japan"  },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "east_asia",
  address_city: "Tokyo",  address_country: "Japan"  },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "east_asia",
   address_city: "Busan",  address_country: "South Korea"  },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "east_asia",
   address_city: "Miyajima",  address_country: "Japan"  },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "east_asia",
   address_city: "Guangzhou",  address_country: "China"  },

  { home_type: home_types.shuffle.last, description: lorem,
  num_possible_guests: Faker::Number.number(1), room_type: room_types.shuffle.last,
  num_bathrooms: Faker::Number.number(1), num_bedrooms: Faker::Number.number(1),
  price_per_night: Faker::Number.number(2), address_region: "east_asia",
   address_city: "Suwon",  address_country: "South Korea"  }

]

35.times do |x|

  u = User.create!(fname: Faker::Name.first_name, lname: Faker::Name.last_name,
  email: Faker::Internet.safe_email, password: "secret", description: lorem)

  l = u.listings.create!(room_attrs[x])

  l.availabilities.create!(start_date: "2014-05-01", end_date: "2014-05-08")
  l.availabilities.create!(start_date: "2014-05-17", end_date: "2014-05-24")

  # photo = RestClient.get(image_urls.sample)
  # photo = open(image_urls.sample)

  # l.pictures.create!(image: photo)

  # p = l.pictures.new
  # p.picture_from(image_urls.ampe)
  # puts p.image
  # p.save!

  # p = l.pictures.new
  # p.picture_from(image_urls.shuffle.last)
  # p.save!

  # photo = URI.parse(image_urls.shuffle.last)
  # l.pictures.create!(image: photo)

end