# frozen_string_literal: true

class AddUserInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :login_name, :string, null: false, default: ""
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :region, :string
    add_column :users, :profile, :text
    add_column :users, :men_num, :integer
    add_column :users, :women_num, :integer
  end
end
