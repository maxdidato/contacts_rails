Feature: As a user I want to show the details of an existing user

  Scenario: Show contact details
    Given I create the contact with these details
      | First name | Last name | Email         | Mobile | Landline | Twitter |
      | John        | Rambo     | john@rambo.com | 12343  | 4321     | twitter |
    When I click on the 'Show' link
    Then I should see the details shown




