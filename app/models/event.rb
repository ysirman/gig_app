class Event < ApplicationRecord
  validates :title, presence: true
  validates :gig_date, presence: true
  validates :target_join_num, presence: true
  validates :target_price, presence: true
  validates :region, presence: true
  validates :genre, presence: true

  # イベントの設定
  belongs_to :user

  # イベント参加の設定
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations

  # クリップの設定
  has_many :clips, dependent: :destroy
  has_many :clip_users, through: :clips, source: :user

  # kaminariの設定
  paginates_per 10

  def self.search(params)
    if params[:keyword].present?
      keywords = params[:keyword].split(/[[:blank:]]/)
      queries = keywords.map do |keyword|
        Event.where('title LIKE ?', "%#{keyword}%")
        .or(Event.where('description LIKE ?', "%#{keyword}%"))
        .or(Event.where('location LIKE ?', "%#{keyword}%"))
      end
      result = queries.inject do |scope, query| 
        scope.or(query)
      end
    end
    if params[:gig_date].present?
      gig_date = convert_gig_date_to_i(params[:gig_date])
      query = Event.where('gig_date >= ?', "#{gig_date}")
      result = result ? result.merge(query) : query
    end
    if params[:region].present?
      query = Event.where(region: "#{params[:region]}")
      result = result ? result.merge(query) : query
    end
    result
  end

  def self.convert_gig_date_to_i(gig_date)
    m = gig_date.match(/^(\d{4})年(\d{1,2})月(\d{1,2})日\(.\)$/)
    gig_date = DateTime.new(m[1].to_i, m[2].to_i, m[3].to_i)
  end
end
