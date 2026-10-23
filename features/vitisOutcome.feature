Feature: Record visit outcome

  @GH-02
  Scenario: Technician completes a repair that needs occupant confirmation
    Given job J-1042 is allocated to technician T-07
    And access to the property is confirmed
    And the job requires occupant confirmation
    When the technician records the outcome "Completed"
    Then the job is recorded as "Completed - awaiting confirmation"
    And the request remains open

  Rule: A temporary repair does not complete a request

    @GH-03
    Scenario: Leak made safe while a part is ordered
      Given job J-1042 is allocated to technician T-07
      And access to the property is confirmed
      When the technician records the outcome "Made safe"
      Then the job is recorded as a temporary repair
      And the request remains open