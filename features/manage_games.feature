Feature: Manage Games
  In order to manage games
  As a user
  I want to create and manage games

  Scenario: Games List
    Given I have games titled TheNileI, CapeVinny, TakeThatHamlet!, TheBigOne, TheNileII, G1stOfJ
    When I go to the list of games
    Then I should see "TheNileI"
    Then I should see "CapeVinny"
    Then I should see "TakeThatHamlet!"
    Then I should see "TheBigOne"
    Then I should see "TheNileII"
    Then I should see "G1stOfJ"

  Scenario: Cannot Create Game when Not Signed In
    Given I am not signed in
    And I am on the list of games
    Then I should not see "New Game"

  Scenario: Can Create Game when Signed In
    Given the following user records
    | username | password | email                |
    | dave     | davepw   | townsend@patriot.net |
    And I am signed in as "dave" with password "davepw"

    When I go to the list of games

    Then I should see "New Game"

  Scenario: Create Valid Game
    Given the following user records
    | username | password | email                |
    | dave     | davepw   | townsend@patriot.net |
    And I am signed in as "dave" with password "davepw"
    And I am on the list of games

    When I follow "New Game"
    And I fill in "Name" with "Test New Game"
    And I fill in "Turn" with "1"
#    And I select "2011" from "game_deadline_1i"
    And I set the "game_deadline" timestamp to "2010-11-23 10:30"
    And I select "Move Orders" from "game_deadline_type_id"
    And I press "Create Game"

    Then I should see "Game was successfully created."
