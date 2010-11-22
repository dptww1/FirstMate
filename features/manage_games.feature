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
