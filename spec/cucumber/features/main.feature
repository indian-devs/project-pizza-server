Feature: General

  Scenario Outline: Content-Type Header should be set to application/json

    All requests which has a "Content-Type" header must set its value to contain "application/json"

    When the client creates a GET request to /<path> from <origin>
    And sends the request
    Then the request contains the header 'access-control-allow-origin' set to <origin>
    And the request contains the header 'access-control-allow-methods' set to GET

    Examples:
      | path    | origin                |
      | pizza   | http://localhost:3000 |
      | pizeria | http://localhost:3000 |
      | compare | http://localhost:3000 |

