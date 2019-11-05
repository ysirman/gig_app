# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Participations", type: :system do
  background(:each) do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.create(:event)
    login_as @user, scope: :user
  end

  scenario "can be created by user", js: true do
    visit root_path
    expect {
      within(".eventList") do
        find(".participate-btn > a").click
      end
      expect(page).to have_content "参加申込しました"
    }.to change { Participation.count }.by(1)
  end

  scenario "can be shown by owner" do
    participation = FactoryBot.create(:participation, user_id: @user.id, event_id: @event.id)
    visit user_path(@user.id)
    click_on I18n.t(:'activerecord.models.participation')
    expect(page).to have_content participation.event.title
  end

  scenario "can be deleted by owner", js: true do
    participation = FactoryBot.create(:participation, user_id: @user.id, event_id: @event.id)
    visit root_path
    expect {
      within(".eventList") do
        find(".participate-btn > a").click
      end
      expect(page).to have_content "キャンセルしました"
    }.to change { Participation.count }.by(-1)
  end

  scenario "can be confirmed", js: true do
    event = FactoryBot.create(:event, user_id: @user.id, fixed: true)
    candidate = FactoryBot.create(:user)
    participation = FactoryBot.create(:participation, event_id: event.id, user_id: candidate.id)
    other_participation = FactoryBot.create(:participation, event_id: event.id)
    visit event_path(event.id)
    expect(page).to have_content "参加者候補"
    target_checkbox_id = "id_#{participation.id}"
    check("#{target_checkbox_id}", allow_label_click: true)
    click_on "参加者を確定する"
    page.accept_confirm
    expect(page).to have_content I18n.t(:"flash.success.update")
    expect(page).to have_content "参加者（確定）"
    within(".fixed_participation_list") do
      expect(page).to have_content candidate.name
    end
  end
end
