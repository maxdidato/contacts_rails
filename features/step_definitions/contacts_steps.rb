Given /^I go to '(.*)' page$/ do |page|
  $browser.goto("#{APPLICATION_URL}#{page}")
end

When /^I click on the '(.*)' link$/ do |text|
  $browser.link(:text => text).click
  sleep (1)
end

When /^I type '(.*)' in the (.*) field$/ do |value, field|
  $browser.text_field(:label => field).set value
end

When /^I click on '(.*)' button$/ do |button|
  $browser.button(:text => button).click
  sleep(1)
end

Then /^I should see (.*) as first name and (.*) as last name in the contact list$/ do |firstname, lastname|
  sleep(1)
  if $browser.table(:id => 'contacts').trs.find { |tr| tr.tds[0].text==firstname && tr.tds[1].text == lastname }.nil?
    raise "Contact not in the list"
  end
end


Given /^I create the contact with these details$/ do |data|
  @data = data
  step "I go to 'contacts' page"
  step "I click on the 'Add contact' link"
  sleep(1)
  data.hashes.first.each do |field_name, value|
    step "I type '#{value}' in the #{field_name} field"
  end
  step "I click on 'Save' button"
end

Then /^I should see the details shown$/ do
  sleep(1)
  @data.hashes.first.each do |field_name, value|
    unless $browser.p(:text => "#{field_name}: #{value}").exists?
      raise "Value #{value} not found for field #{field_name}"
    end
  end
end

Then /^I should not see the contact in the contact list$/ do
  sleep(1)
  data = @data.hashes.first
  unless $browser.table(:id => 'contacts').trs.find { |tr| tr.tds[0].text==data['First name'] && tr.tds[1].text == data['Last name'] }.nil?
    raise "Contact still in the list"
  end
end

When /^I accept the popup$/ do
  $browser.driver.switch_to.alert.dismiss
end
When /^I change the details as following$/ do |data|
  @data = data
  sleep(1)
  data.hashes.first.each do |field_name, value|
    step "I type '#{value}' in the #{field_name} field"
  end
  step "I click on 'Save' button"
end

When /^I type '(.*)' in the search box$/ do |value|
  $browser.text_field(:id => 'search').set value
end
Then /^I should not see (.*) as first name and (.*) as last name in the contact list$/ do |firstname, lastname|
  sleep(1)
  unless $browser.table(:id => 'contacts').trs.find { |tr| tr.tds[0].text==firstname && tr.tds[1].text == lastname }.nil?
    raise "Contact not in the list"
  end
end
Then /^I should see '(.*)'$/ do |text|
  raise "Expected to see #{text}" unless $browser.text.include?(text)
end