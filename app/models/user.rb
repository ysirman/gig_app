class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # フォローの設定
  has_many :active_follow_relations, class_name:  "FollowRelation", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_follow_relations, source: :followed
  has_many :passive_follow_relations, class_name:  "FollowRelation", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_follow_relations, source: :follower

  # イベント参加の設定
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations
  
  # クリップ参加の設定
  has_many :clips, dependent: :destroy
  has_many :clip_events, through: :clips, source: :event

  paginates_per 20
  
  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end
  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_follow_relations.find_by(followed_id: other_user.id).destroy
  end
  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  # イベントに参加していたら id を返す
  def participating?(event)
    participation = participations.find_by(event_id: event.id)
    if participation
      participation.id
    end
  end

  # クリップしていたら id を返す
  def clipping?(event)
    clip = clips.find_by(event_id: event.id)
    if clip
      clip.id
    end
  end
end
