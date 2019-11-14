# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    association :user
    sequence(:id)    { |n| n }
    sequence(:title) { |n| "ロックなイベント#{n}" }
    description      { "ロック好きな人々のために一緒にイベントを開催しましょう" }
    target_join_num  { 5 }
    target_price     { 3000 }
    region           { "福岡" }
    genre            { "POPS JAZZ" }
    gig_date         { Date.tomorrow }
    created_at       { Time.now }
    updated_at       { Time.now }
  end
end
