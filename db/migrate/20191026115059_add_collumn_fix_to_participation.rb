# frozen_string_literal: true

class AddCollumnFixToParticipation < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :fixed, :boolean, default: false, null: false
  end
end
