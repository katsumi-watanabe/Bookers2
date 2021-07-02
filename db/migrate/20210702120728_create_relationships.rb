class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, foreign_key: true
      t.integer :followed_id, foreign_key: { to_table: :users }

      t.timestamps

      t.index [:follower_id, :followed_id], unique: true
    end
  end
end
