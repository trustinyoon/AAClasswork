# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

    User.destroy_all
    ArtWork.destroy_all
    ArtworkShare.destroy_all


    #Artists
    mike = User.create!({username: "Mike"})
    kiet = User.create!({username: "Kiet"})
    joe = User.create!({username: "Joe"})

    #Viewers
    coco = User.create!({username: "Coco"})
    nana = User.create!({username: "Nana"})
    waffle = User.create!({username: "Waffle"})

    #Artwork
    art1 = ArtWork.create!({title: "Masterpiece", image_url: "maspeace.com", artist_id: mike.id})
    art2 = ArtWork.create!({title: "Mona Lisa", image_url: "monalisa.com", artist_id: mike.id})
    art3 = ArtWork.create!({title: "Crayon Drawing", image_url: "crayon.com", artist_id: kiet.id})
    art4 = ArtWork.create!({title: "Pier", image_url: "pier.com", artist_id: kiet.id})
    art5 = ArtWork.create!({title: "Big Sur", image_url: "bigsur.com", artist_id: joe.id})
    art6 = ArtWork.create!({title: "Birds", image_url: "birds.com", artist_id: joe.id})

    #Artwork Shares
    art_shares1 = ArtworkShare.create!({artwork_id: art1.id, viewer_id: coco.id})
    art_shares2 = ArtworkShare.create!({artwork_id: art2.id, viewer_id: coco.id})
    art_shares3 = ArtworkShare.create!({artwork_id: art3.id, viewer_id: nana.id})
    art_shares4 = ArtworkShare.create!({artwork_id: art4.id, viewer_id: nana.id})
    art_shares5 = ArtworkShare.create!({artwork_id: art5.id, viewer_id: waffle.id})
    art_shares6 = ArtworkShare.create!({artwork_id: art6.id, viewer_id: waffle.id})

end
