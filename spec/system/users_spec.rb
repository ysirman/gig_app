# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Users", type: :system do
  scenario "can sign up", js: true do
    visit root_path
    click_on I18n.t(:"devise.shared.links.sign_up")
    fill_in I18n.t(:"activerecord.attributes.user.name"), with: "fuga taro"
    fill_in I18n.t(:"activerecord.attributes.user.genre"), with: "POPS ROCK"
    within(".user_form > .region") do
      find("input.select-dropdown").click
      find(".dropdown-content > li:nth-child(3) > span").click
    end
    fill_in I18n.t(:"activerecord.attributes.user.email"), with: "fuga@fuga.fuga"
    find("#user_password").set("fuga password")
    find("#user_password_confirmation").set("fuga password")
    page.find(".actions").click_on I18n.t(:"helpers.submit.create")
    expect(page).to have_content I18n.t(:"devise.registrations.signed_up")
    expect(page).to have_content "fuga taro"
  end

  scenario "can login" do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in I18n.t(:"activerecord.attributes.user.email"), with: user.email
    fill_in I18n.t(:"activerecord.attributes.user.password"), with: user.password
    page.find(".actions").click_on I18n.t(:"devise.shared.links.sign_in")
    expect(page).to have_content I18n.t(:"devise.sessions.signed_in")
    expect(page).to have_content user.name
  end

  scenario "can update profile" do
    user = FactoryBot.create(:user)
    login_as user, scope: :user
    visit user_path(user.id)
    click_on I18n.t(:"devise.registrations.edit.title")
    fill_in I18n.t(:"activerecord.attributes.user.name"), with: "another name"
    click_on I18n.t(:"devise.registrations.edit.update")
    expect(page).to have_content I18n.t(:"devise.registrations.updated")
    expect(page).to have_content "another name"
  end

  scenario "can delete own user", js: true do
    user = FactoryBot.create(:user)
    login_as user, scope: :user
    visit user_path(user.id)
    expect {
      click_on I18n.t(:"devise.registrations.edit.title")
      click_on I18n.t(:"devise.registrations.edit.cancel_my_account")
      page.accept_confirm
      expect(current_path).to eq root_path
    }.to change { User.count }.by(-1)
  end
end
