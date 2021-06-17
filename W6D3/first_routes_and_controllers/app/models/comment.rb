class Comment < ApplicationRecord

    belongs_to :user, dependent: :destroy,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :art_work, dependent: :destroy,
        foreign_key: :art_work_id,
        class_name: :ArtWork

end