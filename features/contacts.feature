Feature: Personal contact list

  Scenario: Add a contact
    Given I go to 'contacts' page
    And I click on the 'Add contact' link
    When I type 'Max' in first name field
    And I click on 'Create'
    Then I should see the user created