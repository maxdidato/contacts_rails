Feature: This feature validate the fields during the creation or the editing of a contact
  Mandatory field: First Name, Last Name, email, mobile
  Email format
  Only numbers allowed in Mobile and Landline
  Only letters and namespaces allowed in FirstName and LastName
  Only valid Twitter usernames allowed

  Background:
    Given I go to 'contacts' page
    And I click on the 'Add contact' link

  Scenario: Mandatory fields
    When I click on 'Save' button
    Then I should see 'First name can't be blank'
    And I should see 'Last name can't be blank'
    And I should see 'Email can't be blank'
    And I should see 'Mobile can't be blank'

  Scenario: Invalid Email
    Given I type 'Max' in the First name field
    And I type 'Smith' in the Last name field
    And I type '0123345' in the Mobile field
    And I type '4443434' in the Landline field
    When I type 'incorrect_email' in the Email field
    And I click on 'Save' button
    Then I should see 'Email is invalid'

  Scenario: Invalid FirstName and LastName
    Given I type '0123345' in the Mobile field
    And I type '4443434' in the Landline field
    And I type 'email@email.com' in the Email field
    When I type 'Max_1' in the First name field
    And I type 'Smith_2' in the Last name field
    And I click on 'Save' button
    Then I should see 'First name only allows letters'
    Then I should see 'Last name only allows letters'

  Scenario: Invalid Mobile and Landline
    Given I type 'Max' in the First name field
    And I type 'Smith' in the Last name field
    And I type 'email@email.com' in the Email field
    When I type '0123fs345' in the Mobile field
    And I type '444343sdfs4' in the Landline field
    And I click on 'Save' button
    Then I should see 'Mobile is not a number'
    Then I should see 'Landline is not a number'

  Scenario: Invalid Twitter account
    Given I type 'Max' in the First name field
    And I type 'Smith' in the Last name field
    And I type 'email@email.com' in the Email field
    And I type '0123345' in the Mobile field
    And I type '4443434' in the Landline field
    When I type 'ab 42' in the Twitter field
    And I click on 'Save' button
    Then I should see 'Twitter is invalid'