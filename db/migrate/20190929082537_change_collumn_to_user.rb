class ChangeCollumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :login_name, unique: true
  end
end
