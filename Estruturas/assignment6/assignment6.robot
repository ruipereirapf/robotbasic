*** Settings ***
Documentation    Practice IF and Loops

*** Variables ***
@{NUMBERS_LIST}   ${1}    ${2}    ${3}    ${4}    ${5}    ${6}    ${7}    ${8}    ${9}    ${10}

*** Test Cases ***

Test Case 01
    Using FOR with IF


*** Keywords ***

Using FOR with IF
    Log To Console   ${\n}
    FOR    ${NUMBER}    IN    @{NUMBERS_LIST}
        IF    ${NUMBER} == 5
            Log    Im Number 5!
        ELSE IF    ${NUMBER} == 10
            Log    Im Number 10!
        ELSE
            Log    Im neither 5 nor 10!
        END
    END