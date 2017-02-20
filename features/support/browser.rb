# Browser class to handle the browser initialize/destroy workflow
module Browser
  def self.setup_browser
    ENV['BROWSER'] = 'headless' unless ENV['BROWSER']
    browser_name = ENV['BROWSER'].downcase.to_sym

    if browser_name == :headless
      @headless = Headless.new dimensions: '1920x1080x24'
      @headless.start
      @driver = Selenium::WebDriver.for :firefox
    elsif browser_name == :browserstack

      ENV['BR_STACK_USER'] = 'USERNAME' unless ENV['BR_STACK_USER']
      br_stack_user = ENV['BR_STACK_USER'].downcase.to_sym

      ENV['BR_STACK_PASS'] = 'ACCESS_KEY' unless ENV['BR_STACK_PASS']
      br_stack_pass = ENV['BR_STACK_PASS'].downcase.to_sym

      # Input capabilities

      # Firefox

      caps = Selenium::WebDriver::Remote::Capabilities.new
      caps['browser'] = 'Firefox'
      caps['browser_version'] = '46.0'
      caps['os'] = 'OS X'
      caps['os_version'] = 'El Capitan'
      caps['resolution'] = '1024x768'

      # Safari
      
      #caps['browser'] = 'Safari'
      #caps['browser_version'] = '9.1'
      #caps['browserstack.safari.enablePopups'] = 'true'
      #caps['os'] = 'OS X'
      #caps['os_version'] = 'El Capitan'
      #caps['resolution'] = '1024x768'

      caps['browserstack.debug'] = 'true'
      caps['name'] = 'Testing Santander with Ruby on BrowserStack'
      caps['build'] = 'v1'
      caps['project'] = 'MTPI LAB'

      @driver = Selenium::WebDriver.for(:remote,
                                       :url => 'http://' + br_stack_user.to_s + ':' + br_stack_pass.to_s + '@hub-cloud.browserstack.com/wd/hub',
                                       :desired_capabilities => caps)


    else
      @driver = Selenium::WebDriver.for browser_name
    end
  end

  def self.tear_down
    if ENV['BROWSER'].downcase.to_sym == :browserstack
      @driver.quit
    else
      @driver.close
    end
    @headless.destroy if @headless
  end
end
