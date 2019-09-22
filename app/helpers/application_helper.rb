module ApplicationHelper
  # ジャンルをスペース区切りで取得
  def genres(genres)
    genres = genres.split(/[[:blank:]]/)
  end
end
