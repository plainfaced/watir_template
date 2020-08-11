@example
Feature: Example feature

  Scenario: User can search google
    Given I am viewing google
    When I enter "Benjamin Upton"
    Then my site will be listed