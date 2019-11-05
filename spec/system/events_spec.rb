# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Events", type: :system do
  background(:each) do
    @user = FactoryBot.create(:user)
    login_as @user, scope: :user
  end

  scenario "can be created by user", js: true do
    visit root_path
    expect {
      click_link "イベント作成"
      fill_in I18n.t(:"activerecord.attributes.event.title"), with: "ロックなイベント"
      fill_in I18n.t(:"activerecord.attributes.event.description"), with: "ロック好きな人々のために一緒にイベントを開催しましょう"
      fill_in I18n.t(:"activerecord.attributes.event.target_join_num"), with: 5
      fill_in I18n.t(:"activerecord.attributes.event.target_price"), with: 3000
      within(".event_form > .region") do
        find("input.select-dropdown").click
        find(".dropdown-content > li:nth-child(3) > span").click
      end
      fill_in I18n.t(:"activerecord.attributes.event.genre"), with: "POPS JAZZ"
      fill_in I18n.t(:"activerecord.attributes.event.gig_date"), with: DateTime.new(2019, 9, 23)
      click_button I18n.t(:"helpers.submit.create")
      expect(page).to have_content I18n.t(:"flash.success.create")
      expect(page).to have_content "ロックなイベント"
    }.to change { Event.count }.by(1)
  end

  scenario "can be shown" do
    event = FactoryBot.create(:event)
    visit root_path
    click_on event.title
    expect(page).to have_content event.title
    expect(page).to have_content event.target_price
  end

  scenario "can be updated by event owner" do
    event = FactoryBot.create(:event, user_id: @user.id)
    visit root_path
    click_on event.title
    click_on "イベント編集"
    fill_in I18n.t(:"activerecord.attributes.event.title"), with: "ポップなイベント"
    click_button I18n.t(:"helpers.submit.update")
    expect(page).to have_content I18n.t(:"flash.success.update")
    expect(page).to have_content "ポップなイベント"
  end

  scenario "can be deleted by owner", js: true do
    event = FactoryBot.create(:event, user_id: @user.id)
    visit root_path
    expect {
      click_on event.title
      click_on "イベント削除"
      page.accept_confirm "削除しますか？"
      expect(page).to have_content I18n.t(:"flash.success.destroy")
    }.to change { Event.count }.by(-1)
  end

  scenario "can be closed recruitment of participants", js: true do
    event = FactoryBot.create(:event, user_id: @user.id)
    visit event_path(event.id)
    click_on "募集を締め切る"
    page.accept_confirm
    expect(page).to have_content I18n.t(:"flash.success.update")
    expect(page).to have_content I18n.t(:'activerecord.attributes.event.fixed')
    visit root_path
    expect(page).to have_content I18n.t(:'activerecord.attributes.event.fixed')
  end
end
