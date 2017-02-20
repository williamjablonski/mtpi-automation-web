Before do |_scenario|
  @browser = nil
  @browser = Browser.setup_browser
  @browser.manage.window.maximize
end

After do |scenario|
  if scenario.failed?
    if ExecutionEnvironment.browser != :browserstack
      @browser.save_screenshot "./#{Time.now.strftime("log/#{scenario.name}_%Y%m%d-%H%M%S")}.png"
      embed "./#{Time.now.strftime("log/#{scenario.name}_%Y%m%d-%H%M%S")}.png", 'image/png'
    end

  end
  Browser.tear_down
end
