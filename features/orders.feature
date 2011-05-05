Feature: Orders
  In order to play a scenario
  As a participant in a game
  I need to be able to enter and edit orders

  Background:
    Given I have a game titled "Orders Feature" created by "dave"
      And "dave" is Captain of "Ship1" on Side1
      And "paul" is Admiral of "Ship2" on Side1
      And "andy" is Captain of "Ship3" on Side2
      And "wren" is Admiral of "Ship4" on Side2
      And the current turn is 2

  Scenario: Participant can enter orders for the current turn
    When I am signed in as "dave"
     And "dave" entered orders "P1S" for "Ship1" on turn 1
     And I visit the game show page for "Orders Feature"
    Then I should see a row with "Ship1" and then "Enter Orders"
     And I should see "Ship2"
     But I should not see a row with "Ship2" and then "Enter Orders"

  Scenario: Participant can edit existing orders for the current turn, but not previous turns
    When I am signed in as "dave"
     And "dave" entered orders "P1S" for "Ship1" on turn 1
     And "dave" entered orders "3" for "Ship1" on turn 2
     And I visit the game show page for "Orders Feature"
    Then I should not see a row with "Ship1" and then "Enter Orders"
     And I should not see a row with "Ship1" and then "P1S"
     But I should see a row with "Ship1" and then "3"

  Scenario: Non-participant cannot enter orders at all
    Given I am not signed in
    When I visit the game show page for "Orders Feature"
    Then I should not see "Enter Orders"
