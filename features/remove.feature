Feature: As a user I wanto to delete an existing contact

  Scenario: Remove a contact
    Given I create the contact with these details
      | First name | Last name | Email         | Mobile | Landline | Twitter |
      | John        | Rambo     | john@rambo.com | 12343  | 4321     | twitter |
    When I click on the 'Destroy' link
    Then I should not see the contact in the contact list
