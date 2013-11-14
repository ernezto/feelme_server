Feature: registration

  Scenario Outline: Register happy and unhappy votes for a day
    Given I am on home_page
    And I fill in "<happy_count>" for "daily_mood_happy_count" 
    And I fill in "<unhappy_count>" for "daily_mood_unhappy_count" 
    And I fill in "<date>" for "daily_mood_date" 
    When I press "Create Daily mood"
    Then the result should be <output> on the screen

  Examples:
    | happy_count | unhappy_count | date        | output            |
    | 20          | 30            | 2013-11-11  | "Registered!"     |

  Scenario: Consulta indice diario
    Given I am on home_page
    And I fill in "9" for "daily_mood_happy_count" 
    And I fill in "1" for "daily_mood_unhappy_count" 
    And I fill in "2013-11-14" for "daily_mood_date" 
    And I press "Create Daily mood"
    When I am on dashboard
    Then The "happy_percent" should be "90 %"
    And  The "unhappy_percent" should be "10 %"
