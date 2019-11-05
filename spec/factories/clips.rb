# frozen_string_literal: true

FactoryBot.define do
  factory :clip do
    association   :user
    association   :event
    sequence(:id) { |n| n }
    created_at    { Time.now }
    updated_at    { Time.now }
  end
end
