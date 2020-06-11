@example
Feature: Example feature

  Scenario: User can navigate to The Concert Archive and search
    Given I am viewing the concert archive
    When I enter 'chemical brothers'
    Then I can view those results