# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Comments", type: :system do
  background(:each) do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.create(:event, fixed: true)
    login_as @user, scope: :user
  end

  scenario "can be created by event participant" do
    FactoryBot.create(:participation, user_id: @user.id, event_id: @event.id, fixed: true)
    visit event_path(@event)
    expect {
      find("#comment_description").set("テスト用のコメント")
      page.find(".actions").click_on "コメントする"
      expect(page).to have_content I18n.t(:"flash.success.create")
    }.to change { Comment.count }.by(1)
  end

  scenario "can be shown by event participant" do
    FactoryBot.create(:participation, user_id: @user.id, event_id: @event.id, fixed: true)
    comment = FactoryBot.create(:comment, user_id: @user.id, event_id: @event.id)
    visit event_path(@event)
    click_on "コメントをもっと見る"
    expect(page).to have_content comment.description
  end

  scenario "can't be shown by non participant" do
    comment = FactoryBot.create(:comment)
    visit event_path(@event)
    expect(page).to_not have_content comment.description
  end
end
