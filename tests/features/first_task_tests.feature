Feature: First Task Tests

  Scenario: Get response
    Given I send request
    Then I receive valid response

  Scenario: Get response body
    Given I have response
    When I try to get body
    Then Body is retrieved from response

  Scenario: Get value
    Given I have response
    When I try to get output value
    Then Output value is received

  Scenario: Split value char by char
    Given I have value
    When I split value
    Then I see array with splitted value

  Scenario: Count chars
    Given I have splited value
    When I count chars
    Then Chars are counted correctly