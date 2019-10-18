# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name      "hogeTaro"
    password  "hogePassword"
    region    "福岡"
    genre     "POPS"
    sequence(:login_name) { |n| "hogetaro#{n}" }
    sequence(:email) { |n| "hoge#{n}@hoge.hoge" }
  end
end
