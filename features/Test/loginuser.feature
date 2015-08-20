Feature: Logging in by a user
@login
Scenario Outline: Authorised login
Given I navigate to flipkart
When I clicked the login button
And I login with the <username> and <password>
Then Error should come
Examples:
|username|password|
|username@gmailcom|password|
