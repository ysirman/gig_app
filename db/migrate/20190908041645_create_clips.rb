# frozen_string_literal: true

class CreateClips < ActiveRecord::Migration[5.2]
  def change
    create_table :clips do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
    # 頻繁に検索するのでインデックス追加
    add_index :clips, :user_id
    add_index :clips, :event_id
    add_index :clips, [:user_id, :event_id], unique: true
  end
end
