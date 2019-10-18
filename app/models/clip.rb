# frozen_string_literal: true

class Clip < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :user_id, presence: true
  validates :event_id, presence: true
end
