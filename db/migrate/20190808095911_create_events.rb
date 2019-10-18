# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :gig_date,      null: false, default: -> { "NOW()" }
      t.string :user_id,         null: false, default: ""
      t.string :target_join_num
      t.string :region,          null: false
      t.string :place
      t.string :target_price
      t.text :description

      t.timestamps
    end
  end
end
