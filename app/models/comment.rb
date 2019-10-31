# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :user_id, presence: true
  validates :event_id, presence: true
  validates :description, presence: true

  # kaminariの設定
  paginates_per 30
end
