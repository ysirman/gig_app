# frozen_string_literal: true

OmniAuth.config.test_mode = true

Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]

def set_omniauth
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    provider: "twitter",
    uid: "12345",
    info: {
      name: "mockName",
      nickname: "mockNickname",
      location: "福岡",
      description: "テストプロフィール"
    },
  })
end
