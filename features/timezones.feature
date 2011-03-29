Feature: Timezones
  In order to have useable deadlines
  As a user
  I want to see localized times

  Background:
    Given the following user records
      | username | password | email        | timezone                   |
      | dave     | davepw   | a123@123.com | Eastern Time (US & Canada) | 

  Scenario: Anonymous User
    Given I have a game titled "TestGame" created by "dave"
      And I am not signed in
    When I go to the list of games
    Then I should see a row with "TestGame" and then "2010-12-20 14:30"


  Scenario: User with Time Zone
    Given I have a game titled "TestGame2" created by "dave"
      And I am signed in as "dave" with password "davepw"
    When I go to the list of games
    Then I should see a row with "TestGame2" and then "2010-12-20 09:30"
    
