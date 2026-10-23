Feature: Report maintenance problem

  Rule: A request is accepted only when property, location, problem, contact person and access availability are given

    @GH-01
    Scenario: Request without access availability is returned
      Given reporter R-101 reports a leak at property P-12 in location "Kitchen"
      And the request names a contact person
      And no access availability is given
      When the coordinator reviews the request
      Then the request is returned for more information
      And no job is created