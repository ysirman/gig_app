# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :user
    association :event
    sequence(:id)           { |n| n }
    sequence(:description)  { |n| "テストコメント#{n}" }
    created_at              { Time.now }
    updated_at              { Time.now }
  end
end
