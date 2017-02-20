# Available environment variables
# URL - Page to be tested
# PROXY - Set as true to start proxy
# PROXY_PATH - Inform the path were browsermob is installed
# MAC - "/opt/browsermob/bin/browsermob-proxy"
# WINDOWS - "c:\\browsermob-proxy\\bin\\browsermob-proxy.bat"
module ExecutionEnvironment
  def url
    raise 'The environment variable URL was not defined in command line' if ENV['URL'].nil?
    ENV['URL']
  end

  module_function :url
end