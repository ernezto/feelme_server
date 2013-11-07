Feature: registration

  Scenario Outline: Register happy and unhappy votes for a day
    Given I am on home_page
    And I fill in "<happy_value>" for "happy_value" 
    And I fill in "<unhappy_value>" for "unhappy_value" 
    When I press "Submit"
    Then the result should be <output> on the screen

  Examples:
    | happy_value | unhappy_value | output            |
    | 20          | 30            | "Registered!"     |
