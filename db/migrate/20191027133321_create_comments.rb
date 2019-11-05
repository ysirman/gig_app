# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
    # 頻繁に検索するのでインデックス追加
    add_index :comments, :user_id
    add_index :comments, :event_id
  end
end
