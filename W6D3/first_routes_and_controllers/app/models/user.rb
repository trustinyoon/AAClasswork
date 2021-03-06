class User < ApplicationRecord
  validates :username, presence: true

    has_many :artworks, dependent: :destroy,
      foreign_key: :artist_id,
      class_name: :ArtWork

    has_many :artwork_shares, dependent: :destroy,
      foreign_key: :viewer_id,
      class_name: :ArtworkShare

    has_many :shared_artworks,
      through: :artwork_shares,
      source: :artwork

    has_many :comments,
      foreign_key: :user_id,
      class_name: :Comment
end