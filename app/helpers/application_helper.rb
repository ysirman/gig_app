# frozen_string_literal: true

module ApplicationHelper
  # ジャンルをスペース区切りで取得
  def genres(genres)
    genres.split(/[[:blank:]]/).uniq
  end
end
