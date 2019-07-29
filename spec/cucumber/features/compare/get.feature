@todo
Feature: Compare Pizzas

  User should be able to send a request to our API in order to compare two pizzad. Our API should validate the structure of the payload and respond with an error if it is invalid

  Scenario: Empty Request Params

    If the user sends a GET request to /compare with empty request params, they should receive a response with a 400 status code.

    When the client creates a GET request to /compare from http://localhost:3000 with empty params
    And sends the request
    Then our API should respond with a 400 HTTP status code
    And the content type of the response should be JSON
    And they payload of the response should be a JSON object
    And contains an error property set to true
    And contains a message property which says "Request should contain the pizza"

  Scenario: Invalid Pizza

    If the user sends a GET request to /compare with invalid pizza slug, they should receive a response with a 400 status code.

    When the client creates a GET request to /compare from http://locahost:3000 with invalid pizza
    And sends the request
    Then our API should respond with a 400 HTTP status code
    And the content type of the response should be JSON
    And the payload of the response should be a JSON object
    And contains an error property set to true
    And contains a message property which says "The pizzaSlug must be valid"

  Scenario: Minimal Valid Request

    If the user sends a GET request to /compare with valid pizzas, they should receive a response with a 200 status code.

    When the client creates a GET request to /compare from http://locahost:3000 with valid pizza
    And sends the request
    Then our API should respond with a 200 HTTP status code
    And the content type of the response should be JSON
    And the payload of the response should be a JSON object
    And contains an error property set to false
    And contains a message property which says "Operation successful"
    And contains a payload property of type object
    And the payload contains a result property of type object
