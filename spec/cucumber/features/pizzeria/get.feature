@todo
Feature: Get details of a single pizzeria

  User should be able to send a request to our API in order to get details of a selected pizzeria. Our API should validate the structure of the payload and respond with an error if it is invalid

  Scenario: Invalid Pizzeria ID

    If the user sends a GET request to /pizzeria/:id with invalid pizzeria ID, they should receive a response with a 400 status code.

    When the client creates a GET request to /pizzeria/id from http://locahost:3000 with invalid pizzeria
    And sends the request
    Then our API should respond with a 400 HTTP status code
    And the content type of the response should be JSON
    And the payload of the response should be a JSON object
    And contains an error property set to true
    And contains a message property which says "The pizzeriaID must be valid"

  Scenario: Minimal Valid Request

    If the user sends a GET request to /pizzeria/:id with valid pizzeria ID, they should receive a response with a 200 status code.

    When the client creates a GET request to /pizzeria/id from http://locahost:3000 with valid pizzeria
    And sends the request
    Then our API should respond with a 200 HTTP status code
    And the content type of the response should be JSON
    And the payload of the response should be a JSON object
    And contains an error property set to false
    And contains a message property which says "Successfully retrieved a list of pizza"
    And contains a payload property of type object
    And the payload contains a pizzas property of type array
