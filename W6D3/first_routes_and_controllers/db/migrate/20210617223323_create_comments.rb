class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false 
      t.integer :art_work_id, null: false

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :art_work_id
  end
end
