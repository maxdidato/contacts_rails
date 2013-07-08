Feature: Personal contact list

  Scenario: Add a contact
    Given I go to 'contacts' page
    And I click on the 'Add contact' link
    When I type 'Max' in the First name field
    And I type 'Smith' in the Last name field
    And I type 'email@email.com' in the Email field
    And I type '0123345' in the Mobile field
    And I type '4443434' in the Landline field
    And I type 'twitteraccount' in the Twitter field
    And I click on 'Save' button
    Then I should see Max as first name and Smith as last name in the contact list

  Scenario: Add a contact with a picture
    Given I go to 'contacts' page
    And I click on the 'Add contact' link
    And I fill up the form to create a new user
    When I click on Browser

  Scenario: Show contact details
    Given I create the contact 'John Rambo' with these details
      | First Name | Last Name | Email         | Mobile | Landline | Twitter |
      | John        | Rambo     | john@rambo.com | 12343  | 4321     | twitter |
    When I click on Show
    Then I should see the details shown

  Scenario: Remove a contact
    Given I create the contact 'John Rambo'
    When I click on Destroy
    Then I should not see John Rambo in the contact list

  Scenario: Edit a contact
    Given I create a contact with these details:
      | First Name | Last Name | Email         | Mobile | Landline | Twitter |
      | Max        | Smith     | max@smith.com | 12343  | 4321     | twitter |
    And I click on the 'Edit' link
    And I change the details as following
      | First Name | Last Name | Email             | Mobile | Landline | Twitter     |
      | Max_mod    | Smith_mod | max_mod@smith.com | 9999   | 8888     | twitter_mod |
    When I click on the 'Show' link
    Then I should see the details shown

   Scenario: Edit a contact picture

   Scenario: Input validation