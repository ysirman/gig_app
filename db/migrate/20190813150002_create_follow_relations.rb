class CreateFollowRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_relations do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    # 頻繁に検索するのでインデックス追加
    add_index :follow_relations, :follower_id
    add_index :follow_relations, :followed_id
    add_index :follow_relations, [:follower_id, :followed_id], unique: true
  end
end
