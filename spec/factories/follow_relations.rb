# frozen_string_literal: true

FactoryBot.define do
  factory :follow_relation do
    association   :follower, factory: :user
    association   :followed, :other_user, factory: :user
    sequence(:id) { |n| n }
    created_at    { Time.now }
    updated_at    { Time.now }
  end
end
