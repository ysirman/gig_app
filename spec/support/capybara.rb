# Capybara自体の設定、ここではどのドライバーを使うかを設定
Capybara.configure do |capybara_config|
  capybara_config.default_driver = :selenium_chrome
end

# Capybaraに設定したドライバーの設定
Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('headless') # ヘッドレスモードをonにするオプション
  options.add_argument('--disable-gpu') # 暫定的に必要なフラグ
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

# ヘッドレスモードを使ってテストを実行
Capybara.javascript_driver = :selenium_chrome_headless
