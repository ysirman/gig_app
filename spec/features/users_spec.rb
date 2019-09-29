require 'rails_helper'
include Warden::Test::Helpers

RSpec.feature "Users", type: :feature do
  background(:each) do
    Capybara.current_session.driver.browser.manage.window.resize_to(1280, 720)
  end

  xscenario 'can sign up' do
    visit root_path
    click_on I18n.t(:'devise.shared.links.sign_up')
    fill_in I18n.t(:'activerecord.attributes.user.name'), with: 'fuga taro'
    fill_in I18n.t(:'activerecord.attributes.user.login_name'), with: 'fuga'
    fill_in I18n.t(:'activerecord.attributes.user.genre'), with: 'POPS ROCK'
    fill_in I18n.t(:'activerecord.attributes.user.region'), with: '福岡'
    fill_in I18n.t(:'activerecord.attributes.user.email'), with: 'fuga@fuga.fuga'
    fill_in I18n.t(:'activerecord.attributes.user.password'), with: 'fuga password'
    fill_in I18n.t(:'activerecord.attributes.user.password_confirmation'), with: 'fuga password'
    fill_in I18n.t(:'activerecord.attributes.user.login_name'), with: 'fuga password'
    page.find('.actions').click_on I18n.t(:'devise.shared.links.sign_up')

    expect(page).to have_content I18n.t(:'devise.registrations.signed_up')
    expect(page).to have_content 'fuga taro'
  end

  xscenario 'can login' do
    user = FactoryBot.create(:user)
    visit root_path
    visit new_user_session_path
    fill_in I18n.t(:'activerecord.attributes.user.email'), with: user.email
    fill_in I18n.t(:'activerecord.attributes.user.password'), with: user.password
    page.find('.actions').click_on I18n.t(:'devise.shared.links.sign_in')

    expect(page).to have_content I18n.t(:'devise.sessions.signed_in')
    expect(page).to have_content user.name
  end

  xscenario 'can update profile' do
    user = FactoryBot.create(:user)
    login_as user, scope: :user
    visit user_path(user.id)
    click_on I18n.t(:'devise.registrations.edit.title')
    fill_in I18n.t(:'activerecord.attributes.user.name'), with: 'another name'
    fill_in I18n.t(:'activerecord.attributes.user.current_password'), with: user.password
    click_on I18n.t(:'devise.registrations.edit.update')

    expect(page).to have_content I18n.t(:'devise.registrations.updated')
    expect(page).to have_content 'another name'
  end

  xscenario 'can delete own user' do
    user = FactoryBot.create(:user)
    login_as user, scope: :user
    visit user_path(user.id)
    expect {
      click_on I18n.t(:'devise.registrations.edit.title')
      click_on I18n.t(:'devise.registrations.edit.cancel_my_account')
      page.accept_confirm

      expect(current_path).to eq root_path
    }.to change { User.count }.by(-1)
  end
end
