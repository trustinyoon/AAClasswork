class User < ApplicationRecord
  validates :username, presence: true

    has_many :artworks,
      foreign_key: :artist_id,
      class_name: :ArtWork

    has_many :artwork_shares,
      foreign_key: :viewer_id,
      class_name: :ArtWorkShare

    has_many :shared_artworks,
      through: :artwork_shares,
      source: :artwork
end