require 'rake'

ROOT_DIR = "#{File.dirname(__FILE__)}/../.."

After do
  sleep(1)
  $browser.links(:text => "Destroy").each do |link|
    link.click if link.present?
    sleep(1)
  end
end
