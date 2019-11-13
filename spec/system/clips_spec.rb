# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Clips", type: :system do
  background(:each) do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.create(:event)
    login_as @user, scope: :user
  end

  scenario "can be created by user", js: true do
    visit root_path
    expect {
      within(".eventList") do
        find(".clip-btn > a").click
      end
      expect(page).to have_content "クリップしました"
    }.to change { Clip.count }.by(1)
  end

  scenario "can be shown by owner" do
    clip = FactoryBot.create(:clip, user_id: @user.id, event_id: @event.id)
    visit user_path(@user.id)
    click_on I18n.t(:'activerecord.models.clip')
    expect(page).to have_content clip.event.title
  end

  scenario "can be deleted by owner", js: true do
    FactoryBot.create(:clip, user_id: @user.id, event_id: @event.id)
    visit root_path
    expect {
      within(".eventList") do
        find(".clip-btn > a").click
      end
      expect(page).to have_content "クリップを削除しました"
    }.to change { Clip.count }.by(-1)
  end
end
