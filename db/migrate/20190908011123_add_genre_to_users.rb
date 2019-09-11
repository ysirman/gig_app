class AddGenreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :genre, :string, null: false, default: ""
  end
end
