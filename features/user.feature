Feature: Test CRUD User
Scenario: Checks that a user can be created
Given I am on the new_user page
And I fill in "user_name" with "Nhut Nguyen"
And I fill in "user_username" with "nhutnguyen"
And I fill in "user_email" with "nhut@gmail.com"
And I fill in "user_phone" with "0989979121"
And I fill in "user_description" with "This is Nhut!"
When I press "Create User"
Then I should see "Nhut Nguyen"

Scenario: Checks that a user can be read
Given I am on the users page
When I clicked on "Nhut Nguyen" link within "#item_0"
Then I should see "Nhut Nguyen"

Scenario: Checks that a user can be updated
Given I am on the users page
When I clicked on "Edit" link within "#item_0"
And I fill in "user_description" with "This is Nhut from TINYPulse!"
When I press "Update User"
Then I should see "This is Nhut from TINYPulse!"

Scenario: Checks that a user can be destroyed
Given I am on the users page
When I clicked on "Delete" link within "#item_0"
And I confirm popup
Then I should not see "Nhut Nguyen"