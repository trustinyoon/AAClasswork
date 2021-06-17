# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create({username: 'nicha'})
user2 = User.create({username: 'trustin'})
user3 = User.create({username: 'charis'})
user4 = User.create({username: 'acye'})
user5 = User.create({username: 'walker'})


artwork1 = ArtWork.create({title: 'A', image_url: 'a@', artist_id: '1'})
artwork2 = ArtWork.create({title: 'B', image_url: 'b@', artist_id: '2'})
artwork3 = ArtWork.create({title: 'C', image_url: 'c@', artist_id: '3'})
artwork4 = ArtWork.create({title: 'D', image_url: 'd@', artist_id: '4'})



artwork_shares = ArtWorkShare.create({artwork_id: 2, viewer_id: 2})

