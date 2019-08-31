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

  # イベントに参加する
  def participate(event)
    events << event
  end
  # イベント参加を取り消す
  def unparticipate(event)
    participations.find_by(event_id: event.id).destroy
  end
  # イベントに参加していたらtrueを返す
  def participating?(event)
    participations.include?(event)
  end
end
