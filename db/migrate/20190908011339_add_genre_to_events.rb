# frozen_string_literal: true

class AddGenreToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :genre, :string, null: false, default: "ALL"
  end
end
