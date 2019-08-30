class RenamePlaceColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :place, :location
  end
end
