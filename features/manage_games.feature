Feature: Manage Games
  In order to manage games
  As a site visitor
  I want to create and manage games

  Background:
    Given the following user records
      | username | password | email                |
      | dave     | davepw   | townsend@patriot.net |
      | paul     | paulpw   | townsend@patriot.net |

  Scenario: Games List
    Given I have a game titled "The Nile" created by "dave"
      And I have a game titled "Cape Vinny" created by "paul"
      And I have a game titled "Take That, Hamlet!" created by "dave"
      And I have a game titled "The Big One" created by "paul"
      And I have a game titled "The Nile II" created by "dave"
    When I go to the list of games
    Then I should see "The Nile"
     And I should see "Cape Vinny"
     And I should see "Take That, Hamlet!"
     And I should see "The Big One"
     And I should see "The Nile II"

  Scenario: Anonymous users cannot create games
    Given I am not signed in
    When I go to the list of games
    Then I should not see "New Game"
     And I should not see "My Games"

  Scenario: Signed-in users can create games
    Given I am signed in as "dave" with password "davepw"
    When I go to the list of games
    Then I should see "New Game"
     And I should see "My Games"

  Scenario: A new valid game should show up in the list of games
    Given I am signed in as "dave" with password "davepw"
      And I am on the list of games
    When I follow "New Game"
     And I fill in "Name" with "Test New Game"
     And I fill in "Turn" with "1"
     And I fill in "Deadline" with "2011-01-23 10:30:00"
     And I select "Move Orders" from "game_deadline_type_id"
     And I fill in "Side1" with "Side One"
     And I fill in "Side2" with "Side Two"
     And I press "Create Game"
    Then I should see "Game 'Test New Game' created."
     And I should see a row with "Test New Game" and then "Delete"

  Scenario: Game creators have the option to delete their own games, but not others
    Given I am signed in as "dave" with password "davepw"
      And I have a game titled "Deletable" created by "dave"
      And I have a game titled "Immune" created by "paul"
    When I go to the list of games
    Then I should see a row with "Deletable" and then "Delete"
     And I should not see a row with "Immune" and then "Delete"

  Scenario: Game creators should actually be able to delete their games
    Given I am signed in as "dave" with password "davepw"
      And I have a game titled "DELETE ME" created by "dave"
    When I go to the list of games
     And I follow "Delete"
    Then I should see "Game 'DELETE ME' deleted"
     And I should see "My Games"
      
