# frozen_string_literal: true

class ChangeLoginNameDenyNull < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :login_name, :string, default: nil, null: true
  end
end
