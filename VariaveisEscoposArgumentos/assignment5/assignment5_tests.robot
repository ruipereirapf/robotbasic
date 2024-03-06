*** Settings ***
Documentation    Practice keywords with arguments and returns
Library          FakerLibrary


*** Test Cases ***

Test Case 01
    ${first_name}     First Name
    ${last_name}      Last Name

    ${email}    Person email    ${first_name}    ${last_name}
    Log To Console    ${email}


*** Keywords ***

Person email
    [Arguments]    ${first_name}    ${last_name}
    ${random_word}    Word
    ${email}    Set Variable    ${first_name}${last_name}${random_word}@testerobot.com
    [Return]    ${email}