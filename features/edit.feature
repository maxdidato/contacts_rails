Feature: As a user I want to edit an existing contact

  Scenario: Edit a contact
    Given I create the contact with these details
      | First name | Last name | Email         | Mobile | Landline | Twitter |
      | Max        | Smith     | max@smith.com | 12343  | 4321     | twitter |
    And I click on the 'Edit' link
    And I change the details as following
      | First name | Last name | Email         | Mobile | Landline | Twitter |
      | OtherName    | OtherLastName | max_mod@smith.com | 9999   | 8888     | twitter_mod |
    When I click on the 'Show' link
    Then I should see the details shown