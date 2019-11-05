# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Omniauth", type: :system do
  background(:each) do
    OmniAuth.config.mock_auth[:twitter] = nil
  end

  scenario "can authenticate and login" do
    set_omniauth
    expect {
      visit root_path
      click_on I18n.t(:"devise.shared.links.sign_up")
      click_on I18n.t(:"devise.shared.links.sign_in_with_provider", provider: "twitter")
      expect(page).to have_content I18n.t(:"devise.omniauth_callbacks.success", kind: "twitter")
    }.to change { User.count }.by(1)
  end

  scenario "can authenticate exist user" do
    set_omniauth
    user = FactoryBot.create(:user)
    login_as user, scope: :user
    visit edit_user_registration_path
    click_on "TWITTERアカウントと連携"
    expect(page).to have_content I18n.t(:"devise.omniauth_callbacks.success", kind: "twitter")
  end
end
