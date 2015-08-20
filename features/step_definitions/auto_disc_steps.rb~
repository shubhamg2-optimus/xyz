Given(/^I am on the auto\-disc page$/) do
visit AutodiscPage
end

When(/^I delete old filters$/) do
on AutodiscPage do |page|
page.delete_old_filter
end
end

When(/^I Enter Range\/Filter Name "(.*?)", Type "(.*?)" and Range\/Filter Pattern "(.*?)" and click the button$/) do |name, type, value|
on AutodiscPage do |page|
page.add_filter(name, type, value)
sleep(5)
end
end


When(/^I check the auto\-commit radio button$/) do
on AutodiscPage do |page|
page.select_auto_commit
end
end

When(/^I click Go button$/) do
on AutodiscPage do |page|
page.go
sleep(2)
end
end

When(/^I check the checkbox of Accept and click go$/) do
on AutodiscPage do |page|
if (page.start_new_discovery_element.exists?)
sleep(3)
page.start_new_discovery
sleep(5)
page.check_accept_discovery
sleep(2)
page.confirm_go
sleep(3)
else
sleep(2)
page.check_accept_discovery
sleep(2)
page.confirm_go
sleep(3)
end
end
end

Then(/^the close button is visible and I click on that$/) do
on AutodiscPage do |page|
sleep(30)
page.close_discovery_element.wait_until_present
page.close_discovery
end
end

Given(/^I navigate to the status viewer page$/) do
visit StatusPage
end

When(/^I click on the Search button$/) do
on StatusPage do |page|
page.search_button
sleep(4)
end
end

When(/^I enter the host ip "(.*?)" in the text field$/) do |value|
on StatusPage do |page|
page.search_textfield = value
sleep(1)
page.go_search_button
sleep(3)
end
end

Then(/^the host is visible in the results$/) do
on StatusPage do |page|
(page.text.include? '1 Results').should ==true
end
end
