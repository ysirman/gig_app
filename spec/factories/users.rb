# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:id)     { |n| n }
    sequence(:name)   { |n| "hogeTaro#{n}" }
    sequence(:email)  { |n| "hoge#{n}@hoge.hoge" }
    password          { "hogePassword" }
    region            { "福岡" }
    genre             { "POPS" }
    created_at        { Time.now }
    updated_at        { Time.now }

    trait :other_user do
      sequence(:name) { |n| "otherName#{n}" }
    end
  end
end
