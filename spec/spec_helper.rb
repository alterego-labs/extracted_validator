$TESTING = true
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

$CODECLIMATE_REPO_TOKEN = ''

require 'rspec/its'
require 'extracted_validator'
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.order = 'random'
end
