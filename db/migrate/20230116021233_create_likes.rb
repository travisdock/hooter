class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :hoot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.index [:hoot_id, :user_id], unique: true
      t.timestamps
    end
  end
end
