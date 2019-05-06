# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

listing1 = Listing.create(
    name: "Molly",
    description: "Molly is a great dog. ",
    price: 1000,
    )
listing1.image.attach(io: File.open("app/assets/images/dog1.png"), filename:'dog1.png', content_type: 'image/png')

listing2 = Listing.create(
    name: "Bonnie and Clyde",
    description: "Bonnie and Clyde are both great dogs. ",
    price: 5000,
)
listing2.image.attach(io: File.open("app/assets/images/dog2.png"), filename:'dog2.png', content_type: 'image/png')

listing3 = Listing.create(
    name: "Myffy",
    description: "Myffy is a great dog. ",
    price: 2500,
)
listing3.image.attach(io: File.open("app/assets/images/dog3.png"), filename:'dog3.png',content_type: 'image/png')

listing4 = Listing.create(
    name: "Nelly",
    description: "Nelly is a great dog. ",
    price: 9000,
)
listing4.image.attach(io: File.open("app/assets/images/dog4.png"), filename:'dog4.png', content_type: 'image/png')