# frozen_string_literal: true

class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
    # 頻繁に検索するのでインデックス追加
    add_index :participations, :user_id
    add_index :participations, :event_id
    add_index :participations, [:user_id, :event_id], unique: true
  end
end
