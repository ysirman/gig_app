# frozen_string_literal: true

module EventsHelper
  # イベントを作成したユーザーの場合 true を返す
  def organizer?(event)
    current_user == event.user
  end

  def participating_and_fixed?(event)
    if current_user
      participation = current_user.participations.find_by(event_id: event.id)
      participation && participation.fixed
    end
  end
end
