# frozen_string_literal: true

class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, [:provider, :uid], unique: true
  end
end
