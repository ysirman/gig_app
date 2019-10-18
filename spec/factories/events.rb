# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    sequence(:title) { |n| "ロックなイベント#{n}" }
    description     "ロック好きな人々のために一緒にイベントを開催しましょう"
    target_join_num 5
    target_price    3000
    region          "福岡"
    genre           "POPS JAZZ"
    gig_date        DateTime.new(2019, 9, 23)
    association     :user
  end
end
