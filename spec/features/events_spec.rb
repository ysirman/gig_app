# frozen_string_literal: true

require "rails_helper"
include Warden::Test::Helpers

RSpec.feature "Events", type: :feature do
  background(:each) do
    Capybara.current_session.driver.browser.manage.window.resize_to(1280, 720)
    @user = FactoryBot.create(:user)
    login_as @user, scope: :user
  end

  xscenario "user creates a new event" do
    visit root_path
    expect {
      click_link "イベント作成"
      fill_in I18n.t(:"activerecord.attributes.event.title"), with: "ロックなイベント"
      fill_in I18n.t(:"activerecord.attributes.event.description"), with: "ロック好きな人々のために一緒にイベントを開催しましょう"
      fill_in I18n.t(:"activerecord.attributes.event.target_join_num"), with: 5
      fill_in I18n.t(:"activerecord.attributes.event.target_price"), with: 3000
      fill_in I18n.t(:"activerecord.attributes.event.region"), with: "福岡"
      fill_in I18n.t(:"activerecord.attributes.event.genre"), with: "POPS JAZZ"
      fill_in I18n.t(:"activerecord.attributes.event.gig_date"), with: DateTime.new(2019, 9, 23)
      click_button I18n.t(:"helpers.submit.create")

      expect(page).to have_content I18n.t(:"flash.success.create")
      expect(page).to have_content "ロックなイベント"
    }.to change { Event.count }.by(1)
  end

  xscenario "user show a event" do
    event = FactoryBot.create(:event)
    visit root_path
    click_on event.title

    expect(page).to have_content event.title
    expect(page).to have_content event.target_price
  end

  xscenario "user update a event" do
    event = FactoryBot.create(:event, user_id: @user.id)
    visit root_path
    click_on event.title
    click_on "イベント編集"
    fill_in I18n.t(:"activerecord.attributes.event.title"), with: "ポップなイベント"
    click_button I18n.t(:"helpers.submit.update")

    expect(page).to have_content I18n.t(:"flash.success.update")
    expect(page).to have_content "ポップなイベント"
  end

  xscenario "user delete a event" do
    event = FactoryBot.create(:event, user_id: @user.id)
    visit root_path
    expect {
      click_on event.title
      click_on "イベント削除"
      page.accept_confirm "削除しますか？"

      expect(page).to have_content I18n.t(:"flash.success.destroy")
    }.to change { Event.count }.by(-1)
  end
end
