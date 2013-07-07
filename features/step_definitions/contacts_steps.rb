Given /^I go to '(.*)' page$/ do |page|
  $browser.goto("#{APPLICATION_URL}#{page}")
end
When /^I click on the '(.*)' link$/ do |text|
  $browser.link(:text => text ).click
  
end
When /^I type '(.*)' in first name field$/ do
  pending
end