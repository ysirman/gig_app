# frozen_string_literal: true

FactoryBot.define do
  factory :participation do
    association   :user
    association   :event
    sequence(:id) { |n| n }
    fixed         { false }
    created_at    { Time.now }
    updated_at    { Time.now }
  end
end
