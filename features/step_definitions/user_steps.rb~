Given(/^I navigate to flipkart$/) do
@browser.goto"http://www.flipkart.com"
end

When(/^I clicked the login button$/) do
  @browser.a(:class,'no-border js-login login-required').when_present.click
end

When(/^I login with the (\w++) and (\w++)$/) do |username, password|
    on LoginPage do |page|
page.login(username, password)
end
end
Then(/^Error should come$/) do
@browser.div(:class =>'fk-inline-block err_text').wait_until_present
(@browser.text.include? 'Invalid details. Please try again.').should == true 
end
