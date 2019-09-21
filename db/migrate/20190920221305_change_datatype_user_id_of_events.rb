class ChangeDatatypeUserIdOfEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :user_id, :string
    add_column :events, :user_id, :integer, default: 0, null: false
  end
end
