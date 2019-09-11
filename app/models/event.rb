class Event < ApplicationRecord
  # イベント参加の設定
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations

  # クリップの設定
  has_many :clips, dependent: :destroy
  has_many :clip_users, through: :clips, source: :user

  paginates_per 10

  def self.search(params)
    unless params[:keyword].empty?
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
    unless params[:gig_date].empty?
      m = params[:gig_date].match(/^(\d{4})年(\d{1,2})月(\d{1,2})日\(.\)$/)
      gig_date = DateTime.new(m[1].to_i, m[2].to_i, m[3].to_i)
      query = Event.where('gig_date >= ?', "#{gig_date}")
      result = result ? result.merge(query) : query
    end
    unless params[:region].empty?
      query = Event.where(region: "#{params[:region]}")
      result = result ? result.merge(query) : query
    end
    result
  end
end
