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
      email: "hoge@hoge.hoge",
      login_name: "hogehoge",
      password: "hogehoge",
      name: "ほげほげhogehogeほげほげ",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      region: "福岡",
      men_num: 5,
      women_num: 5,
      profile: "アニソンで盛り上がる2019夏パーリーナイトを開催します！アニソンだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      email: "fuga@fuga.fuga",
      login_name: "fugafuga",
      password: "hogehoge",
      name: "ほげほげfugafugaほげほげ",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      region: "福岡",
      men_num: 5,
      women_num: 5,
      profile: "アニソンで盛り上がる2019夏パーリーナイトを開催します！アニソンだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      email: "boga@boga.boga",
      login_name: "bogaboga",
      password: "hogehoge",
      name: "ほげほげbogabogaほげほげ",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      region: "福岡",
      men_num: 5,
      women_num: 5,
      profile: "アニソンで盛り上がる2019夏パーリーナイトを開催します！アニソンだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      email: "poga@poga.poga",
      login_name: "pogapoga",
      password: "hogehoge",
      name: "ほげほげpogapogaほげほげ",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      region: "福岡",
      men_num: 5,
      women_num: 5,
      profile: "アニソンで盛り上がる2019夏パーリーナイトを開催します！アニソンだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    }
  ]
)

Event.create!(
  [
    {
      title: "アニソンで盛り上がる2019夏パーリーナイト！！",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      gig_date: DateTime.new(2019, 9, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "福岡",
      location: "beatStation",
      target_price: 3000,
      description: "アニソンで盛り上がる2019夏パーリーナイトを開催します！アニソンだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      title: "レゲェで盛り上がる2019夏パーリーナイト！！",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      gig_date: DateTime.new(2019, 10, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "大阪",
      location: "ハートビートステーション",
      target_price: 3000,
      description: "レゲェで盛り上がる2019夏パーリーナイトを開催します！レゲェだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      title: "メタルで盛り上がる2019夏パーリーナイト！！",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      gig_date: DateTime.new(2019, 11, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "長崎",
      location: "ヤフオクドーム",
      target_price: 3000,
      description: "メタルで盛り上がる2019夏パーリーナイトを開催します！メタルだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      title: "ロックで盛り上がる2019夏パーリーナイト！！",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      gig_date: DateTime.new(2019, 12, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "佐賀",
      location: "Zeppダイバーシティ",
      target_price: 3000,
      description: "ロックで盛り上がる2019夏パーリーナイトを開催します！ロックだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      title: "アニソンで盛り上がる2019夏パーリーナイト！！",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      gig_date: DateTime.new(2019, 1, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "福岡",
      location: "beatStation",
      target_price: 3000,
      description: "アニソンで盛り上がる2019夏パーリーナイトを開催します！アニソンだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      title: "レゲェで盛り上がる2019夏パーリーナイト！！",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      gig_date: DateTime.new(2019, 2, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "大阪",
      location: "ハートビートステーション",
      target_price: 3000,
      description: "レゲェで盛り上がる2019夏パーリーナイトを開催します！レゲェだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      title: "メタルで盛り上がる2019夏パーリーナイト！！",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      gig_date: DateTime.new(2019, 3, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "長崎",
      location: "ヤフオクドーム",
      target_price: 3000,
      description: "メタルで盛り上がる2019夏パーリーナイトを開催します！メタルだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    },
    {
      title: "ロックで盛り上がる2019夏パーリーナイト！！",
      genre: "POPS ROCK JAZZ ポップス 椎名林檎 ジャズ",
      gig_date: DateTime.new(2019, 4, 26, 17, 00),
      user_id: User.first.id,
      target_join_num: 5,
      region: "佐賀",
      location: "Zeppダイバーシティ",
      target_price: 3000,
      description: "ロックで盛り上がる2019夏パーリーナイトを開催します！ロックだけでなく、音楽好きにはもってこいのイベントです。主催者として一緒に盛り上がってくれるバンドを募集しています。よろしくお願いします。",
    }
  ]
)
