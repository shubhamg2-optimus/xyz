Feature: Adding range on auto discovery page
@discovery
Scenario: I add a range of 172.28.113.158
Given I am on the auto-disc page
When I delete old filters
And I Enter Range/Filter Name "testrange", Type "include" and Range/Filter Pattern "172.28.113.158" and click the button
And I check the auto-commit radio button
And I click Go button
And I check the checkbox of Accept and click go
Then the close button is visible and I click on that
@discovery
Scenario: Verifying the results on the status viewer page
Given I navigate to the status viewer page
When I click on the Search button
And I enter the host ip "172.28.113.158" in the text field
Then the host is visible in the results
