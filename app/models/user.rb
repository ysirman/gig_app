# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :genre, presence: true
  validates :region, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  # フォローの設定
  has_many :active_follow_relations, class_name:  "FollowRelation", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_follow_relations, source: :followed
  has_many :passive_follow_relations, class_name:  "FollowRelation", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_follow_relations, source: :follower

  # イベントの設定
  has_many :events

  # イベント参加の設定
  has_many :participations, dependent: :destroy
  has_many :participate_events, through: :participations, source: :event

  # クリップの設定
  has_many :clips, dependent: :destroy
  has_many :clip_events, through: :clips, source: :event

  # コメントの設定
  has_many :comments
  has_many :comment_events, through: :comments

  paginates_per 20

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_follow_relations.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしていたら id を返す
  def following_id?(other_user)
    follow_relation = active_follow_relations.find_by(followed_id: other_user.id)
    if follow_relation
      follow_relation.id
    end
  end

  # イベントに参加していたら id を返す
  def participating_id?(event)
    participation = participations.find_by(event_id: event.id)
    if participation
      participation.id
    end
  end

  # クリップしていたら id を返す
  def clipping_id?(event)
    clip = clips.find_by(event_id: event.id)
    if clip
      clip.id
    end
  end

  def self.search(params)
    if params[:keyword].present?
      keywords = params[:keyword].split(/[[:blank:]]/)
      queries = keywords.map do |keyword|
        User.where("login_name LIKE ?", "%#{keyword}%")
        .or(User.where("name LIKE ?", "%#{keyword}%"))
        .or(User.where("profile LIKE ?", "%#{keyword}%"))
        .or(User.where("genre LIKE ?", "%#{keyword}%"))
      end
      results = queries.inject do |scope, query|
        scope.or(query)
      end
      result = results
    end
    if params[:genre].present?
      genres = params[:genre].split(/[[:blank:]]/)
      queries = genres.map do |genre|
        User.where("genre LIKE ?", "%#{genre}%")
      end
      results = queries.inject do |scope, query|
        scope.or(query)
      end
      result = result ? result.merge(results) : results
    end
    if params[:region].present?
      query = User.where(region: "#{params[:region]}")
      result = result ? result.merge(query) : query
    end
    result
  end

  def self.from_omniauth(auth, signed_in_resource)
    if signed_in_resource
      signed_in_resource.update!(
        provider: auth.provider,
        uid: auth.uid,
        login_name: auth.info.nickname
      )
      signed_in_resource
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = User.dummy_email(auth)
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.login_name = auth.info.nickname
        user.region = auth.info.location
        user.profile = auth.info.description
        user.genre = "ALL"
      end
    end
  end

  private
    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end
end
