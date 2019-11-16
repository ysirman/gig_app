# Gig - 自由にライブを企画しよう -
![gig_top_image](https://user-images.githubusercontent.com/24975537/68983629-3a31c400-084f-11ea-819a-cb286fbbc051.png)
# アプリケーション概要
Gigは、ライブイベントを自由に企画し、参加者を募るためのアプリケーションです。
<br>このアプリの利用ユーザーはバンドマンを想定しており、下記の３種類があります。
* イベント主催者
  * イベントの作成
  * 参加者の募集・選定
* イベント参加者(バンド)
  * イベントへの参加申し込み
  * 他のバンドをフォローする
* 閲覧ユーザー(アカウント未登録)
  * イベント／ユーザーの検索・閲覧のみ可能

# アプリケーションURL
https://www.gig-app.ml/
<br>ログイン画面の「簡単ログイン」ボタンからテストユーザーとして利用可能です。

# アプリケーション機能一覧
* ユーザー関連
  * ログイン・ログアウト
  * OAuth認証(Twitter)
  * プロフィール編集
  * ユーザー検索
  * ユーザーフォロー
  * フォロー・フォロワー一覧表示
* イベント関連
  * イベント検索
  * イベント応募(参加)
  * イベントクリップ(保存)
  * イベント作成
  * 参加イベント一覧表示
  * クリップイベント一覧表示
  * 参加者募集締切
  * 参加者選択(参加者確定)
  * コメント投稿(イベント参加者のみ)

# 使用技術
* Ruby 2.6.5
* Rails 5.2.3
* Vue 2.6.10
* Docker
* Nginx
* AWS<br>
  * EC2<br>
  * RDS(PostgreSQL)<br>
  * ALB<br>
  * ACM<br>
* CircleCI
* Twitter API

# 本番環境構成図
![architecture](https://user-images.githubusercontent.com/24975537/68983197-3b61f180-084d-11ea-8c54-816cd37e43c0.png)
