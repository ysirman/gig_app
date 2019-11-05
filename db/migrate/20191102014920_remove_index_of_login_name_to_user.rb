# frozen_string_literal: true

class RemoveIndexOfLoginNameToUser < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :login_name
  end
end
