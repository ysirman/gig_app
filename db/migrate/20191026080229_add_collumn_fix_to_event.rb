class AddCollumnFixToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :fixed, :boolean, default: false, null: false
  end
end
