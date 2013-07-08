Feature: As a user I want to create a new contact

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

  Scenario: Add a contact with picture
    Given I go to 'contacts' page
    And I click on the 'Add contact' link
    When I type 'Max' in the First name field
    And I type 'Smith' in the Last name field
    And I type 'email@email.com' in the Email field
    And I type '0123345' in the Mobile field
    And I type '4443434' in the Landline field
    And I type 'twitteraccount' in the Twitter field
    And I add 'avatar.jpg' as picture
    And I click on 'Save' button
    And I click on the 'Show' link
    Then I should see 'avatar.jpg' as picture

