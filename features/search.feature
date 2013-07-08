Feature: As a user I want to filter my contact lists by last name

  Scenario: Search a contact by last name
    Given I create the contact with these details
      | First name | Last name | Email         | Mobile | Landline | Twitter |
      | Max        | Smith     | max@smith.com | 12343  | 4321     | twitter |
    And I create the contact with these details
      | First name | Last name | Email         | Mobile | Landline | Twitter |
      | John        | Rambo     | john@rambo.com | 12343  | 4321     | twitter |
    When I type 'Smith' in the search box
    And I click on 'Search' button
    Then I should see Max as first name and Smith as last name in the contact list
    But I should not see John as first name and Rambo as last name in the contact list
    When I click on the 'remove filter' link
    Then I should see John as first name and Rambo as last name in the contact list

