class DeleteColumn < ActiveRecord::Migration[5.2]
  def change
    drop_table :artworks
    add_index :art_works, [:artist_id, :title], unique: true
    add_index :art_works, :artist_id

  end
end
