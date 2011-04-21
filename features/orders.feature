Feature: Orders
  In order to play a scenario
  As a participant in a game
  I need to be able to enter orders

  Background:
    Given I have a game titled "Orders Feature" created by "DaveTest"
    And "DaveTest" is Captain of "Ship1" on Side1
    And "PaulTest" is Admiral of "Ship2" on Side1
    And "AndyTest" is Captain of "Ship3" on Side2
    And "WrenTest" is Admiral of "Ship4" on Side2
    And the current turn is 2

  Scenario: Participant has not entered orders for the current turn
    When I am signed in as "DaveTest"
#    And the orders deadline for "Orders Feature" is 2 days away
    And "DaveTest" entered orders "P1S" for "Ship1" on turn 1
    And I visit the game show page for "Orders Feature"
    Then I should see a row with "Ship1" and then "Enter Orders"
    And I should not see a row with "Ship2" and then "Enter Orders"

  Scenario: Participant can edit existing orders for the current turn
    When I am signed in as "DaveTest"
#    And the orders deadline for "Orders Feature" is 2 days away
    And "DaveTest" entered orders "P1S" for "Ship1" on turn 1
    And "DaveTest" entered orders "3" for "Ship1" on turn 2
    And I visit the game show page for "Orders Feature"
    Then I should not see a row with "Ship1" and then "Enter Orders"
    And I should see a row with "Ship1" and then "Edit"

#  Scenario: Participant cannot enter orders if they are past due
#    When I am signed in as "DaveTest"
##    And the orders deadline for "Orders Feature" is 1 day expired
#    And I visit game_path
#    Then I should not see "Enter Orders"

  Scenario: Non-participant cannot enter orders at all
    Given I am not signed in
    When I visit game_path
    Then I should not see "Enter Orders"
