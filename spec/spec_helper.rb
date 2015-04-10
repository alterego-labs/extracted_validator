$TESTING = true
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

$CODECLIMATE_REPO_TOKEN = '830e010682e6f678daaf56d47bd46eb9dc2e879a9305efd231baba6fec0df541'

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
