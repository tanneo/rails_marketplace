# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  
listings = [
    {
        name: 'Dog 2',
        description: 'This is the first post!',
        price: 300
    },
    {
        name: 'Dog 3',
        description: 'To be or not to be',
        price: 200
    },
    {
        name: 'Dog 4',
        description: 'There\'s a bat in my belfry',
        price: 300
    }
]

Listing.create!(listings) { |item| puts "#{item.name} created." }
