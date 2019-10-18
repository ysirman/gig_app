# frozen_string_literal: true

module EventsHelper
  # イベントを作成したユーザーの場合 true を返す
  def organizer?(event)
    current_user == event.user
  end
end
