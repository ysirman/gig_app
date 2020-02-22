# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    {
      id: 1,
      email: "test@test.com",
      login_name: "hogehoge",
      password: "password",
      password_confirmation: "password",
      name: "test Band apart",
      genre: "FUNK ROCK",
      region: "福岡",
      profile: "福岡で活動しているポップバンドです。３ヶ月に１回のペースでライブをしています。Youtubeでの楽曲配信もしています。一緒にライブできるバンドさんと繋がりたいと思ってますのでよろしくお願いします。",
    },
    {
      id: 2,
      email: "hoge@hoge.hoge",
      password: "password",
      password_confirmation: "password",
      name: "福岡事変",
      genre: "POPS 椎名林檎",
      region: "東京",
      profile: "東京で活動しているポップバンドです。３ヶ月に１回のペースでライブをしています。Youtubeでの楽曲配信もしています。一緒にライブできるバンドさんと繋がりたいと思ってますのでよろしくお願いします。",
    },
    {
      id: 3,
      email: "fuga@fuga.fuga",
      password: "password",
      password_confirmation: "password",
      name: "Cymbalsan",
      genre: "POPS 渋谷系",
      region: "大阪",
      profile: "大阪で活動しているポップバンドです。３ヶ月に１回のペースでライブをしています。Youtubeでの楽曲配信もしています。一緒にライブできるバンドさんと繋がりたいと思ってますのでよろしくお願いします。",
    },
    {
      id: 4,
      email: "piyo@piyo.piyo",
      password: "password",
      password_confirmation: "password",
      name: "Tweedeeeeesn",
      genre: "POPS 渋谷系",
      region: "埼玉",
      profile: "埼玉で活動しているパンクバンドです。３ヶ月に１回のペースでライブをしています。Youtubeでの楽曲配信もしています。一緒にライブできるバンドさんと繋がりたいと思ってますのでよろしくお願いします。",
    },
    {
      id: 5,
      email: "hoga@hoga.hoga",
      password: "password",
      password_confirmation: "password",
      name: "Taylor Swiftly",
      genre: "SOUL POPS HIPHOP",
      region: "佐賀",
      profile: "佐賀で活動しているロックバンドです。３ヶ月に１回のペースでライブをしています。Youtubeでの楽曲配信もしています。一緒にライブできるバンドさんと繋がりたいと思ってますのでよろしくお願いします。",
    }
  ]
)

Event.create!(
  [
    {
      id: 1,
      title: "アニソンで盛り上がる2020夏パーリーナイト！！",
      genre: "POPS ROCK",
      gig_date: DateTime.new(2020, 9, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "福岡",
      location: "beatStation",
      target_price: 3000,
      description: "アニソンで盛り上がる2020夏パーリーナイトを開催します！アニソンだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
      fixed: true,
    },
    {
      id: 2,
      title: "レゲェで盛り上がる2020夏パーリーナイト！！",
      genre: "POPS 渋谷系",
      gig_date: DateTime.new(2020, 10, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "大阪",
      location: "ハートビートステーション",
      target_price: 3000,
      description: "レゲェで盛り上がる2020夏パーリーナイトを開催します！レゲェだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 3,
      title: "メタルで盛り上がる2020夏パーリーナイト！！",
      genre: "ROCK METAL",
      gig_date: DateTime.new(2020, 11, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "長崎",
      location: "ヤフオクドーム",
      target_price: 3000,
      description: "メタルで盛り上がる2020夏パーリーナイトを開催します！メタルだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 4,
      title: "ロックで盛り上がる2020夏パーリーナイト！！",
      genre: "POPS ROCK",
      gig_date: DateTime.new(2020, 12, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "佐賀",
      location: "Zeppダイバーシティ",
      target_price: 3000,
      description: "ロックで盛り上がる2020夏パーリーナイトを開催します！ロックだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 5,
      title: "アニソンで盛り上がる2020夏パーリーナイト！！",
      genre: "アニソン",
      gig_date: DateTime.new(2020, 1, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "福岡",
      location: "beatStation",
      target_price: 3000,
      description: "アニソンで盛り上がる2020夏パーリーナイトを開催します！アニソンだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 6,
      title: "レゲェで盛り上がる2020夏パーリーナイト！！",
      genre: "レゲェ",
      gig_date: DateTime.new(2020, 2, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "大阪",
      location: "ハートビートステーション",
      target_price: 3000,
      description: "レゲェで盛り上がる2020夏パーリーナイトを開催します！レゲェだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 7,
      title: "メタルで盛り上がる2020夏パーリーナイト！！",
      genre: "JAZZ BLUES",
      gig_date: DateTime.new(2020, 3, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "長崎",
      location: "ヤフオクドーム",
      target_price: 3000,
      description: "メタルで盛り上がる2020夏パーリーナイトを開催します！メタルだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 8,
      title: "ロックで盛り上がる2020夏パーリーナイト！！",
      genre: "HIPHOP",
      gig_date: DateTime.new(2020, 4, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "佐賀",
      location: "Zeppダイバーシティ",
      target_price: 3000,
      description: "ロックで盛り上がる2020夏パーリーナイトを開催します！ロックだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 9,
      title: "アニソンで盛り上がる2019夏パーリーナイト！！",
      genre: "POPS ROCK",
      gig_date: DateTime.new(2019, 9, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "福岡",
      location: "beatStation",
      target_price: 3000,
      description: "アニソンで盛り上がる2019夏パーリーナイトを開催します！アニソンだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
      fixed: true,
    },
    {
      id: 10,
      title: "レゲェで盛り上がる2019夏パーリーナイト！！",
      genre: "POPS 渋谷系",
      gig_date: DateTime.new(2019, 10, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "大阪",
      location: "ハートビートステーション",
      target_price: 3000,
      description: "レゲェで盛り上がる2019夏パーリーナイトを開催します！レゲェだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 11,
      title: "メタルで盛り上がる2019夏パーリーナイト！！",
      genre: "ROCK METAL",
      gig_date: DateTime.new(2019, 11, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "長崎",
      location: "ヤフオクドーム",
      target_price: 3000,
      description: "メタルで盛り上がる2019夏パーリーナイトを開催します！メタルだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 12,
      title: "ロックで盛り上がる2019夏パーリーナイト！！",
      genre: "POPS ROCK",
      gig_date: DateTime.new(2019, 12, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "佐賀",
      location: "Zeppダイバーシティ",
      target_price: 3000,
      description: "ロックで盛り上がる2019夏パーリーナイトを開催します！ロックだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 13,
      title: "アニソンで盛り上がる2019夏パーリーナイト！！",
      genre: "アニソン",
      gig_date: DateTime.new(2019, 1, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "福岡",
      location: "beatStation",
      target_price: 3000,
      description: "アニソンで盛り上がる2019夏パーリーナイトを開催します！アニソンだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 14,
      title: "レゲェで盛り上がる2019夏パーリーナイト！！",
      genre: "レゲェ",
      gig_date: DateTime.new(2019, 2, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "大阪",
      location: "ハートビートステーション",
      target_price: 3000,
      description: "レゲェで盛り上がる2019夏パーリーナイトを開催します！レゲェだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 15,
      title: "メタルで盛り上がる2019夏パーリーナイト！！",
      genre: "JAZZ BLUES",
      gig_date: DateTime.new(2019, 3, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "長崎",
      location: "ヤフオクドーム",
      target_price: 3000,
      description: "メタルで盛り上がる2019夏パーリーナイトを開催します！メタルだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      id: 16,
      title: "ロックで盛り上がる2019夏パーリーナイト！！",
      genre: "HIPHOP",
      gig_date: DateTime.new(2019, 4, 26, 17, 00),
      user_id: User.last.id,
      target_join_num: 5,
      region: "佐賀",
      location: "Zeppダイバーシティ",
      target_price: 3000,
      description: "ロックで盛り上がる2019夏パーリーナイトを開催します！ロックだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    }
  ]
)

(2..5).each do |i|
  FollowRelation.create!(follower_id: i, followed_id: 1)
  FollowRelation.create!(follower_id: 1, followed_id: i)
end
(3..8).each do |i|
  Participation.create!(user_id: 1, event_id: i)
  Clip.create!(user_id: 1, event_id: i)
end
(2..4).each do |i|
  Participation.create!(user_id: i, event_id: 1, fixed: true)
  (2..8).each do |j|
    Participation.create!(user_id: i, event_id: j)
  end
end
Participation.create!(user_id: 5, event_id: 1)

Comment.create!(user_id: 1, event_id: 1, description: "イベントの詳細について話し合いましょう")
Comment.create!(user_id: 2, event_id: 1, description: "よろしくお願いします。何時開演ですか？")
Comment.create!(user_id: 1, event_id: 1, description: "18:00です。リハは13:00開始を予定しています。")
Comment.create!(user_id: 2, event_id: 1, description: "了解です。ありがとうございます。")
Comment.create!(user_id: 3, event_id: 1, description: "機材が多いのですが、近くに駐車場はありますか？")
Comment.create!(user_id: 1, event_id: 1, description: "会場から徒歩50mくらいのとこにほげほげパーキングがあります。")
Comment.create!(user_id: 3, event_id: 1, description: "なるほどです。そこを利用してみます！")
