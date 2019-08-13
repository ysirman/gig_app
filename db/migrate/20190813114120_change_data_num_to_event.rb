class ChangeDataNumToEvent < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :target_join_num, 'integer USING CAST(target_join_num AS integer)'
    change_column :events, :target_price, 'integer USING CAST(target_price AS integer)'
  end
end
