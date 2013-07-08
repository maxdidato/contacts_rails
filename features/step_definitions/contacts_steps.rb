Given /^I go to '(.*)' page$/ do |page|
  $browser.goto("#{APPLICATION_URL}#{page}")
end
When /^I click on the '(.*)' link$/ do |text|
  $browser.link(:text => text ).click
  
end
When /^I type '(.*)' in the (.*) field$/ do |value,field|
  $browser.text_field(:label => field).set value
end
When /^I click on '(.*)' button$/ do |button|

  $browser.button(:text => button).click

end
Then /^I should see (.*) as first name and (.*) as last name in the contact list$/ do |firstname,lastname|
  sleep(1)
  $browser.table(:id =>'contacts').trs.find{|tr| tr.tds[0].text==firstname  &&  tr.tds[1].text == lastname}.html
end