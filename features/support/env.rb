
require 'cucumber/rails'
require 'watir'
ActionController::Base.allow_rescue = false

# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
Cucumber::Rails::Database.javascript_strategy = :truncation

ENV.delete("HTTP_PROXY")
ENV.delete("http_proxy")
APPLICATION_URL = "http://localhost:9292/"
$browser = Watir::Browser.new :firefox