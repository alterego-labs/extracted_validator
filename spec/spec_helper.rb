$TESTING = true
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

$CODECLIMATE_REPO_TOKEN = '830e010682e6f678daaf56d47bd46eb9dc2e879a9305efd231baba6fec0df541'

require 'rspec/its'
require 'extracted_validator'
require 'codeclimate-test-reporter'
require 'active_record'

require 'pry-nav'

CodeClimate::TestReporter.start

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

DB_FILE = 'tmp/test_db'

FileUtils.mkdir_p File.dirname(DB_FILE)
FileUtils.rm_f DB_FILE

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: DB_FILE
ActiveRecord::Base.connection.execute 'CREATE TABLE posts (id INTEGER NOT NULL PRIMARY KEY, title VARCHAR(125))'
ActiveRecord::Base.connection.execute 'CREATE TABLE users (id INTEGER NOT NULL PRIMARY KEY, password VARCHAR(125))'

ActiveRecord::Base.connection.execute 'CREATE TABLE articles (id INTEGER NOT NULL PRIMARY KEY, title VARCHAR(125))'
ActiveRecord::Base.connection.execute 'CREATE TABLE comments (id INTEGER NOT NULL PRIMARY KEY, article_id INTEGER, body VARCHAR(256))'

class Post < ActiveRecord::Base
end

class User < ActiveRecord::Base
  attr_accessor :password_confirmation
end

class Article < ActiveRecord::Base
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :article
end

RSpec.configure do |config|
  config.mock_with :rspec

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.order = 'random'
end
