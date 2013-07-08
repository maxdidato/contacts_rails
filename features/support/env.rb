require 'cucumber/rails'
require 'watir'
ENV.delete("HTTP_PROXY")
ENV.delete("http_proxy")
APPLICATION_URL = "http://localhost:9292/"
ROOT_DIR = "#{File.dirname(__FILE__)}/../.."
$browser = Watir::Browser.new :firefox