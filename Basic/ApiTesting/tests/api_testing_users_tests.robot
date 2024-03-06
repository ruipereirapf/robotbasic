*** Settings ***
Resource    ../resources/api_testing_users.resource

*** Variables ***


*** Test Cases ***

# Test Case 01 - Register new user on ServeRest
#     Make a new user
#     Register the user at ServeRest    ${TEST_EMAIL}    WANTED_STATUS=201
#     Verify if the user was registered

# Test Case 02 - Register a user that already exists
#     Make a new user
#     Register the user at ServeRest    ${TEST_EMAIL}    WANTED_STATUS=201
#     Register again the same user
#     Verify if the API does not allow the same user to register again

# Test Case 03 - Consult new registered user data
#     Make a new user
#     Register the user at ServeRest    ${TEST_EMAIL}    WANTED_STATUS=201
#     Consult new user data
#     Check new user data

Test Case 04 - Create a new user and login
    Make a new user
    Register the user at ServeRest    ${TEST_EMAIL}    WANTED_STATUS=201
    Login with created user    ${TEST_EMAIL}    ${PASSWORD}
    Verify if login was successful