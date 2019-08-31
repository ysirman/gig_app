class Event < ApplicationRecord
  # イベント参加の設定
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
end
